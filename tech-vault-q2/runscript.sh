#!/bin/sh
set -eu

# Pastikan skrip dijalankan dari direktori tempatnya berada
cd "$(dirname "$0")"

# Cek apakah folder bisa ditulis, kalau tidak perbaiki permission
if [ ! -w . ]; then
  echo "⚠️  Tidak bisa menulis di direktori ini, mencoba memperbaiki permission..."
  sudo chown -R "$USER:$USER" .
  echo "✅ Permission diperbaiki untuk $(pwd)"
fi

# Buat file activate di direktori saat ini
cat > ./activate <<'ACTIVATE_EOF'
#!/bin/sh
set -eu

# Pindah ke direktori ini
cd "$(dirname "$0")"

# Pastikan user & group tersedia
if ! getent group no-team >/dev/null; then
  echo "🔧 Membuat grup no-team..."
  groupadd -f no-team
fi

if ! id -u anonymous >/dev/null 2>&1; then
  echo "🔧 Membuat user anonymous..."
  useradd -g no-team anonymous
fi

# Buat direktori sementara untuk ekstraksi
TMPDIR=$(mktemp -d ./tmp_extract.XXXXXX)

# Ekstrak archive backup.tar.gz ke TMPDIR
tar -xzf ./backup.tar.gz -C "$TMPDIR"

# Atur permission file dan direktori
find "$TMPDIR" -type f -exec chmod 0664 {} \;
find "$TMPDIR" -type d -exec chmod 0775 {} \;

# Ubah owner & group
chown -R anonymous:no-team "$TMPDIR"

# Buat archive baru ke /tmp
tar -C "$TMPDIR" -czf /tmp/fixed-archive.tar.gz .

# Hapus folder sementara
rm -rf "$TMPDIR"

echo "✅ Archive baru berhasil dibuat di /tmp/fixed-archive.tar.gz"
ACTIVATE_EOF

# Jadikan file activate bisa dieksekusi
chmod +x ./activate

echo "✅ File 'activate' sudah dibuat di $(pwd)"
echo "➡️  Jalankan 'sudo ./activate' untuk mengeksekusi tugas."

