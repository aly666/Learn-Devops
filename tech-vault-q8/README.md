Konteks  

Anda bertanggung jawab atas pipeline CI/CD untuk aplikasi web Python. Aplikasi ini dibangun menggunakan Flask dan kode sumbernya disimpan di repositori GitHub.

Tujuan

Buat workflow GitHub Actions yang melakukan hal berikut:

Men-trigger workflow setiap kali ada push ke branch main dan pada pull request yang menargetkan branch main.

Menggunakan environment Python 3.x.

Menginstal paket Python yang didefinisikan di requirements.txt.

Menjalankan unit test yang ada di folder tests.

Jika unit test berhasil dan workflow di-trigger oleh push ke main, lakukan deploy aplikasi ke server cloud pilihan Anda (AWS, Azure, dll.).

Batasan

Gunakan satu file YAML untuk workflow GitHub Actions.

Asumsikan Anda sudah memiliki credential yang diperlukan untuk deploy ke cloud.
