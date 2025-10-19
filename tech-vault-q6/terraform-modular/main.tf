terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Module S3
module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = "tf-test-bucket-yogi"
}

# Module VPC
module "vpc_setup" {
  source      = "./modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

# Module EC2
module "ec2_instance" {
  source        = "./modules/ec2"
  instance_type = "t2.micro"
  environment   = "Dev"
  vpc_id        = module.vpc_setup.vpc_id
  subnet_id     = module.vpc_setup.subnet_id
}

