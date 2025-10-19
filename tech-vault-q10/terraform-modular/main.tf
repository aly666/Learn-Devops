provider "aws" {
  region = local.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source        = "./modules/ec2"
  subnet_id     = module.vpc.public_subnets[0]
  ami           = "ami-0c55b159cbfafe1f0" # ganti sesuai region
  instance_type = "t3.micro"
  vpc_id        = module.vpc.vpc_id
}

module "rds" {
  source     = "./modules/rds"
  subnet_ids = module.vpc.public_subnets
  db_name    = "mydb"
  username   = "admin"
  password   = "Password123!"
}

