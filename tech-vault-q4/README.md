SSL Certificates (Secure Sockets Layer Certificates) adalah sertifikat digital yang digunakan untuk mengamankan koneksi antara pengguna (browser)
 dan server (website) dengan cara mengenkripsi data yang dikirim di antara keduanya.

Sekarang sebenarnya teknologi yang digunakan sudah bukan SSL lagi, tapi TLS (Transport Layer Security) — namun istilah “SSL Certificate”
masih umum dipakai.

STEP 1
mkdir tech-vault-q4
nano secrecy.key
nano security.crt

STEP 2
jalankan sh
kubectl config get-contexts

sudo bash -c 'bash /home/aly/Learn-Devops/tech-vault-q4/taskrunner.sh'

alias execute='bash ~/Learn-Devops/tech-vault-q4/taskrunner.sh'
sudo bash -c "$(alias execute | cut -d"'" -f2)"

