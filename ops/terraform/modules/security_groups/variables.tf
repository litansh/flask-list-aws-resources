variable "aws_vpc_id" {
  type = string
}

variable "ingress_ports" {
  type = list(number)
}

variable "name" {
  type = string
}

variable "source_cidr_block" {
  type = list(string)
}

variable "allow_icmp" {
  type    = bool
  default = false
}
