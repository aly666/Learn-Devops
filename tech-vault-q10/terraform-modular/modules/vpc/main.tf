resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge({"Name" = "${local.project_name}-vpc"}, var.tags)
}

resource "aws_subnet" "public" {
  for_each = toset(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.this.id
  cidr_block = each.value
  map_public_ip_on_launch = true
  tags = merge({"Name" = "${local.project_name}-public-${each.value}"}, var.tags)
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets" {
  value = [for s in aws_subnet.public : s.id]
}

