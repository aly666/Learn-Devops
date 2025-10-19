variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "allowed_ssh_cidr" {
  description = "IP yang diizinkan untuk SSH"
  type        = list(string)
  default     = ["YOUR.IP.ADDRESS/32"]
}

variable "ami" {
  description = "AMI ID untuk EC2 instance"
  type        = string
  default     = "ami-0abcdef1234567890"
}

variable "instance_type" {
  description = "Tipe EC2 instance"
  type        = string
  default     = "t3.micro"
}

