# Terraform Project AWS v6.x

## Prerequisites
- Terraform >= 1.5
- AWS CLI terkonfigurasi
- S3 bucket & DynamoDB table untuk remote state

## Cara Pakai
1. Clone repo
2. Sesuaikan variabel di `terraform.tfvars`
3. Inisialisasi Terraform
```bash
terraform init
4. terraform workspace new staging
terraform workspace select staging
terraform plan
terraform apply

