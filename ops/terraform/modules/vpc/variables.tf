variable "cidr_block" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}