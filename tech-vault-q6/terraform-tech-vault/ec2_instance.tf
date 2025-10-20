###########################################
# CLEANUP NOTE:
# - Gunakan versi ini (Terraform ≥ 1.9)
# - Sudah sesuai dengan AWS Provider 6.x
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
###########################################
provider "aws" {
  region = var.aws_region
}

###########################################
# VARIABLE SECTION
###########################################
variable "aws_region" {
  description = "Region AWS tempat EC2 dibuat"
  type        = string
  default     = "ap-southeast-1"
}

###########################################
# STEP 1: DATA SOURCE — AMI Amazon Linux 2
# - Mencari AMI ID terbaru dari AWS
###########################################
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}

###########################################
# STEP 2: CREATE EC2 INSTANCE
# - Menggunakan tipe t2.micro
# - Menggunakan AMI hasil query di atas
# - Diberi tag “Environment: Dev”
###########################################
resource "aws_instance" "dev_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    Name        = "dev-instance"
    Environment = "Dev"
  }
}

