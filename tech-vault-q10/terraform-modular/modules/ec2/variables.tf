variable "subnet_id" {}
variable "ami" {}
variable "instance_type" {
  default = "t3.micro"
}
variable "vpc_id" {}
variable "tags" {
  type = map(string)
  default = {}
}

