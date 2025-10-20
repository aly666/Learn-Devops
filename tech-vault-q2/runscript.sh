#!/bin/bash
# File: q2/runscript.sh
# Deskripsi: Membuat alias 'activate' agar semua langkah dijalankan dengan satu perintah

# Membuat alias activate
alias activate='sudo bash -c "
cd /home/aly/Learn-Devops/tech-vault-q2
tar -xzf backup.tar.gz
find . -type f -exec chmod 664 {} \;
find . -type d -exec chmod 775 {} \;
chown -R anonymous:no-team .
tar -czf /tmp/fixed-archive.tar.gz .
"'

# Pesan untuk user
echo "Alias 'activate' telah dibuat. Jalankan:"
echo "  source ./runscript.sh"
echo "lalu jalankan 'sudo activate' untuk mengeksekusi semua langkah."

