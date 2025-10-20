###########################################
# CLEANUP INSTRUCTION:
# - Hapus semua konfigurasi lama (versi 1.6)
# - Ganti dengan konfigurasi ini agar mendukung Terraform 1.9+
# - Kompatibel penuh dengan AWS Provider v6.x
###########################################

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

###########################################
# PROVIDER CONFIGURATION
# - Mengatur region tempat resource dibuat
# - Kredensial diambil dari environment (AWS CLI)
###########################################
provider "aws" {
  region = var.aws_region
}

###########################################
# VARIABLE SECTION
# - Supaya region bisa diubah tanpa ubah kode
###########################################
variable "aws_region" {
  description = "Region AWS untuk resource"
  type        = string
  default     = "ap-southeast-1"
}

###########################################
# STEP 1: CREATE BUCKET S3
# - Membuat bucket baru dengan nama unik
# - Ganti sesuai nama Anda agar global unique
###########################################
resource "aws_s3_bucket" "main" {
  bucket = "tf-test-bucket-sutrisno-2025" # <-- ubah jika sudah ada
  force_destroy = true  # biar terraform bisa hapus walau ada object

  tags = {
    Name = "tf-s3-main"
    Environment = "development"
  }
}

###########################################
# STEP 2: ENABLE VERSIONING
# - Mengaktifkan versioning untuk backup versi file
###########################################
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = "Enabled"
  }
}

###########################################
# STEP 3: CREATE UPLOADS FOLDER
# - Folder di S3 hanyalah object dengan key "uploads/"
# - Membuat folder virtual di bucket
###########################################
resource "aws_s3_object" "uploads_folder" {
  bucket  = aws_s3_bucket.main.bucket
  key     = "uploads/"
  content = ""  # kosong, hanya untuk membuat folder tampil

  depends_on = [aws_s3_bucket_versioning.versioning]
}

