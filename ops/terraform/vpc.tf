module "my_own_vpc" {
  source               = "./modules/vpc"
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "MY-OWN-VPC"
  }
}
