Skenario

Anda baru saja bergabung dengan tim DevOps di Quantum Corp. Tim sedang mengotomatisasi proses deployment untuk aplikasi baru berbasis Kubernetes. Mereka memilih ArgoCD sebagai alat GitOps. Tugas Anda adalah mengatur pipeline ArgoCD untuk mendeploy aplikasi contoh dari repository Git ke cluster Kubernetes.

Persyaratan

Fork repository aplikasi contoh yang diberikan oleh perusahaan. (Untuk contoh ini, anggap saja aplikasi sederhana Nginx pada deployment K8s.)

Install ArgoCD pada cluster Kubernetes. Anda bisa menggunakan Minikube atau Rancher Desktop untuk pengembangan lokal.

Buat ArgoCD Application yang mendeploy aplikasi contoh dari repository yang sudah di-fork.

Lakukan perubahan pada aplikasi, lalu push ke repository Git. Validasi bahwa ArgoCD secara otomatis mendeteksi perubahan ini dan mendeploy-nya.

Siapkan strategi Rollback untuk ArgoCD Application.

Dokumentasikan langkah-langkah yang telah diambil beserta skrip atau definisi YAML yang dibuat.

Kriteria Penilaian

Instalasi dan konfigurasi ArgoCD yang benar.

Berhasil melakukan deployment aplikasi berbasis GitOps.

Kemampuan untuk secara otomatis memperbarui aplikasi berdasarkan commit Git.

Berhasil melakukan rollback deployment.

Dokumentasi dan kualitas kode yang baik.
