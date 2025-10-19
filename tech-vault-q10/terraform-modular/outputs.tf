output "ec2_ip" {
  value = module.ec2.ec2_public_ip
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

