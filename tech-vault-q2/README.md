Catatan penting

Skrip ini bekerja di lingkungan yang bersih selama:

File /q2/backup.tar.gz tersedia.

Pengguna dan grup anonymous serta no-team ada di sistem (jika tidak ada, chown akan gagal — bisa ditambahkan pengecekan atau membuat user/group jika diperlukan).

Semua pekerjaan dilakukan di dalam /q2 (ekstraksi ke tmp di bawah /q2) dan output akhir berada di /tmp/fixed-archive.tar.gz sesuai permintaan.

Jika ingin menambahkan pengecekan (mis. apakah anonymous/no-team memang ada), beri tahu saya dan saya akan tambahkan validasinya.

STEP 1
running script.shnya

if error

sudo groupadd -f no-team
id -u anonymous >/dev/null 2>&1 || sudo useradd -g no-team anonymous

STEP 2
ketika di run nanti muncul file active jalankan
sudo ./activate
jika berhasil
✅ Archive baru berhasil dibuat di /tmp/fixed-archive.tar.gz
ls -lh /tmp/fixed-archive.tar.gz
