module "vpc" {
  source         = "./modules/vpc"
  name           = "my-vpc"
  vpc_cidr       = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24","10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24","10.0.102.0/24"]
  azs            = ["ap-southeast-1a","ap-southeast-1b"]
}

module "sg" {
  source          = "./modules/security_group"
  name            = "ec2"
  vpc_id          = module.vpc.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

module "iam" {
  source      = "./modules/iam"
  name        = "ec2"
  policy_json = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = ["s3:ListBucket"]
      Effect   = "Allow"
      Resource = "*"
    }]
  })
}

module "ec2" {
  source               = "./modules/ec2"
  name                 = "app-instance"
  ami                  = var.ami
  instance_type        = var.instance_type
  subnet_id            = module.vpc.private_subnets[0]
  sg_id                = module.sg.sg_id
  iam_instance_profile = module.iam.role_name
}

module "cloudtrail" {
  source   = "./modules/cloudtrail"
  name     = "my-trail"
  s3_bucket = "my-trail-bucket-12345"
  kms_key_id = "arn:aws:kms:ap-southeast-1:123456789012:key/EXAMPLEKEY"
}

module "config" {
  source       = "./modules/config"
  name         = "my-config"
  iam_role_arn = module.iam.role_name
  s3_bucket    = "my-config-bucket-12345"
}

module "cloudwatch_alarm" {
  source       = "./modules/cloudwatch_alarm"
  alarm_name   = "unauthorized-api-calls"
  alarm_actions = ["arn:aws:sns:ap-southeast-1:123456789012:my-sns-topic"]
}

module "secrets_manager" {
  source        = "./modules/secrets_manager"
  secret_name   = "my-app-secret"
  description   = "Secret for my application"
  secret_string = jsonencode({
    db_username = "admin"
    db_password = "supersecret123"
  })
}

