resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  iam_instance_profile   = var.iam_instance_profile
  associate_public_ip_address = false

  root_block_device {
    encrypted = true
    volume_size = 20
  }

  tags = { Name = var.name }
}

output "instance_id" { value = aws_instance.this.id }

