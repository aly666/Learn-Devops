1) Terjemahan (Bahasa Indonesia)

Latihan Terraform 1: Membuat Bucket S3 di AWS

Tujuan

Langkah 1: Buat bucket S3 AWS bernama tf-test-bucket-yourname.

Langkah 2: Aktifkan versioning pada bucket S3 tersebut.

Langkah 3: Buat sebuah folder di dalam bucket tersebut dengan nama uploads.

Catatan

Simpan skrip Terraform Anda sebagai s3_bucket.tf di direktori /home/ubuntu/2023-terraform-s3-creation.

Jalankan terraform apply untuk memastikan skrip dieksekusi tanpa error.

Kredensial AWS sudah terpasang di environment Anda.

Latihan Terraform 2: Membuat VPC

Tujuan

Langkah 1: Buat VPC dengan CIDR block 10.0.0.0/16.

Langkah 2: Buat subnet di VPC tersebut dengan CIDR block 10.0.1.0/24.

Langkah 3: Pasang (attach) sebuah Internet Gateway ke VPC.

Catatan

Simpan skrip sebagai aws_vpc.tf di /home/ubuntu/2023-terraform-vpc-setup.

Jalankan terraform init lalu terraform apply untuk validasi.

Kredensial AWS diasumsikan sudah dikonfigurasi.

Latihan Terraform 3: Mengelola Instance EC2

Tujuan

Langkah 1: Luncurkan instance EC2 t2.micro.

Langkah 2: Gunakan Amazon Linux 2 AMI.

Langkah 3: Tag instance dengan Environment = Dev.

Catatan

Simpan sebagai ec2_instance.tf di /home/ubuntu/terraform-tech-vault.

Pastikan terraform init dan terraform apply dijalankan untuk verifikasi.

Kredensial AWS tersedia di environment.
