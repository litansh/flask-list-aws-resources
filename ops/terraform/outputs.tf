output "aws_vpc_id" {
  value = module.my_own_vpc.aws_vpc_id
}

output "cidr_block" {
  value = var.cidr_block
}

output "my_own_public-1a" {
  value = aws_subnet.my_own_public-1a.id
}

output "my_own_public-1b" {
  value = aws_subnet.my_own_public-1b.id
}