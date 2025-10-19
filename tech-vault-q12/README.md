Konteks

Anda adalah seorang DevOps engineer di perusahaan yang sedang memigrasikan aplikasi on-premises ke AWS. Tugas Anda adalah memastikan postur keamanan dari lingkungan cloud.

Tujuan

Buat Infrastructure as Code (IaC) menggunakan Terraform yang melakukan hal berikut:

Membuat VPC dengan subnet publik dan privat.

Deploy EC2 instance ke subnet privat.

Membuat Security Group yang hanya membuka port yang diperlukan.

Gunakan IAM Roles untuk memberikan EC2 hanya izin minimum (Least Privilege).

Mengatur CloudTrail untuk mencatat semua API call.

Mengaktifkan enkripsi untuk semua storage yang digunakan (EBS, S3, dll.).

Keterbatasan

Gunakan Terraform untuk membuat infrastruktur.

Gunakan modul agar kode bisa digunakan ulang.

Terapkan best practices AWS security (misal: VPC flow logs, disable root user, dll.)

Bonus

Terapkan AWS Config untuk menegakkan kebijakan keamanan.

Buat CloudWatch Alarm untuk mendeteksi tindakan tidak sah.

Gunakan AWS Secrets Manager untuk menyimpan informasi sensitif.

Deliverables

File Terraform (.tf) untuk seluruh infrastruktur.

File README yang menjelaskan:

Cara deploy infrastruktur.

Praktik keamanan yang diterapkan.

Asumsi atau pilihan desain yang dibuat.


terraform/
├─ main.tf
├─ variables.tf
├─ outputs.tf
├─ providers.tf
├─ modules/
│   ├─ vpc/
│   │   ├─ main.tf
│   │   ├─ variables.tf
│   │   └─ outputs.tf
│   ├─ security_group/
│   │   ├─ main.tf
│   │   ├─ variables.tf
│   │   └─ outputs.tf
│   ├─ iam/
│   │   ├─ main.tf
│   │   └─ variables.tf
│   ├─ ec2/
│   │   ├─ main.tf
│   │   └─ variables.tf
│   ├─ cloudtrail/
│   │   ├─ main.tf
│   │   └─ variables.tf
│   ├─ config/
│   │   ├─ main.tf
│   │   └─ variables.tf
│   ├─ cloudwatch_alarm/
│   │   ├─ main.tf
│   │   └─ variables.tf
│   └─ secrets_manager/
│       ├─ main.tf
│       └─ variables.tf
└─ README.md

