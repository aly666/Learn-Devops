output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "security_group_id" {
  value = module.sg.sg_id
}

output "cloudtrail_arn" {
  value = module.cloudtrail.cloudtrail_arn
}

output "secrets_manager_arn" {
  value = module.secrets_manager.secret_arn
}

