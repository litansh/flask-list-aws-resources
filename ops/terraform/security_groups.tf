module "sg_http_only" {
  source            = "./modules/security_groups"
  name              = "SG-80-ONLY"
  aws_vpc_id        = module.my_own_vpc.aws_vpc_id
  ingress_ports     = [80]
  source_cidr_block = [var.cidr_block]
}

module "sg_https_only" {
  source            = "./modules/security_groups"
  name              = "SG-443-ONLY"
  aws_vpc_id        = module.my_own_vpc.aws_vpc_id
  ingress_ports     = [443]
  source_cidr_block = [var.cidr_block]
}