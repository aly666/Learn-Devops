resource "aws_db_subnet_group" "this" {
  name       = "${local.project_name}-db-subnet"
  subnet_ids = var.subnet_ids
  tags       = merge({"Name" = "${local.project_name}-db-subnet"}, var.tags)
}

resource "aws_db_instance" "this" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = var.username
  password             = var.password
  db_subnet_group_name = aws_db_subnet_group.this.name
  skip_final_snapshot  = true
}

output "rds_endpoint" {
  value = aws_db_instance.this.endpoint
}

