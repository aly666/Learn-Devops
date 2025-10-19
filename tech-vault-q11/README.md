Konteks

Anda adalah seorang DevOps engineer yang sedang mengerjakan aplikasi web baru yang menggunakan:

Backend API Python Flask

Cache Redis

Tugas Anda adalah men-container-kan aplikasi ini menggunakan Docker dan mendefinisikan lingkungan multi-container menggunakan Docker Compose.

Tujuan

Buatlah file docker-compose.yml yang:

Mendefinisikan dua layanan (services):

Flask API

Redis cache

Menggunakan multi-stage build untuk Flask API agar ukuran image lebih kecil.

Menggunakan environment variables untuk konfigurasi layanan.

Memasang volumes untuk menyimpan data dan mempermudah pengembangan.

Menggunakan networks untuk mengisolasi dan mengamankan komunikasi antar layanan.

Memastikan Flask API menunggu Redis siap sebelum dijalankan.

Keterbatasan / Aturan

Gunakan versi 3 atau lebih tinggi untuk format Docker Compose.

Ikuti best practices:

Hindari penggunaan user root.

Gunakan .dockerignore untuk mengecualikan file yang tidak perlu.

Layanan harus restart otomatis jika terjadi kegagalan.

Bonus (Opsional)

Gunakan overrides (docker-compose.override.yml) untuk pengaturan khusus development.

Implementasikan healthcheck untuk layanan.

Deliverables / Hasil Akhir

File docker-compose.yml

Dockerfile tambahan atau script yang digunakan

README yang menjelaskan:

Cara menjalankan (up) dan menghentikan (down) environment.

Cara melakukan scaling layanan.

Pilihan desain dan asumsi yang dibuat.

# Flask + Redis Docker Compose

## Menjalankan Environment
docker-compose up -d

## Menghentikan Environment
docker-compose down

## Scaling Service
docker-compose up -d --scale flask-api=3

## Catatan
- Flask API menunggu Redis siap sebelum dijalankan
- Menggunakan multi-stage build untuk image Flask
- Non-root user digunakan untuk keamanan
- Healthcheck diaktifkan untuk Redis dan Flask API

docker-compose up -d

http://localhost:5000/
http://localhost:5000/health

