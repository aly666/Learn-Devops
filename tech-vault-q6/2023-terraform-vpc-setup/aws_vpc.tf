###########################################
# CLEANUP NOTE:
# - Hapus semua konfigurasi lama
# - Gunakan versi ini untuk Terraform ≥ 1.9 dan AWS Provider 6.x
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
# - Mengatur region AWS (contoh: Singapura)
###########################################
provider "aws" {
  region = var.aws_region
}

###########################################
# VARIABLE DECLARATION
# - Supaya bisa ubah region tanpa ubah kode
###########################################
variable "aws_region" {
  description = "AWS region tempat VPC akan dibuat"
  type        = string
  default     = "ap-southeast-1"
}

###########################################
# STEP 1: CREATE VPC
# - CIDR: 10.0.0.0/16 (jaringan utama)
###########################################
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
    Environment = "development"
  }
}

###########################################
# STEP 2: CREATE SUBNET
# - CIDR: 10.0.1.0/24 (subnet publik)
# - Akan menjadi tempat instance nanti
###########################################
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1a"

  tags = {
    Name = "public-subnet"
  }
}

###########################################
# STEP 3: INTERNET GATEWAY
# - Agar resource dalam VPC bisa akses internet
###########################################
resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main-igw"
  }
}

