output "s3_bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "vpc_id" {
  value = module.vpc_setup.vpc_id
}

output "subnet_id" {
  value = module.vpc_setup.subnet_id
}

output "ec2_instance_id" {
  value = module.ec2_instance.instance_id
}

