variable "bucket_name" {
  description = "Nama bucket S3"
  type        = string
}

# Bucket utama
resource "aws_s3_bucket" "tf_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}

# Versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# ACL terpisah sesuai provider v6
resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.tf_bucket.id
  acl    = "private"
}

# Folder "uploads" menggunakan aws_s3_object (replacing deprecated resource)
resource "aws_s3_object" "uploads_folder" {
  bucket  = aws_s3_bucket.tf_bucket.id
  key     = "uploads/"
  content = ""
  acl     = "private"
}

output "bucket_name" {
  value = aws_s3_bucket.tf_bucket.bucket
}

