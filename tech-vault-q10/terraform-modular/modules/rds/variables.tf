variable "subnet_ids" {
  type = list(string)
}
variable "db_name" {}
variable "username" {}
variable "password" {}
variable "tags" {
  type = map(string)
  default = {}
}

