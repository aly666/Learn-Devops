variable "instance_type" {
  type        = string
  description = "Tipe EC2 instance"
}

variable "environment" {
  type        = string
  description = "Environment tag"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID untuk EC2"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID untuk EC2"
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "tf-allow-ssh"
  description = "Allow SSH access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "tf-sg-ssh" }
}

resource "aws_instance" "ec2_dev" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name        = "tf-ec2-dev"
    Environment = var.environment
  }
}

output "instance_id" {
  value = aws_instance.ec2_dev.id
}

