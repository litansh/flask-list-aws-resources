resource "aws_eip" "my_own_ng" {
  vpc = true
}

resource "aws_nat_gateway" "my_own_ng" {
  connectivity_type = "public"
  subnet_id         = aws_subnet.my_own_public-1a.id
  allocation_id     = aws_eip.my_own_ng.id
  tags              = { Name = "MY-OWN-NAT-GW" }
}

resource "aws_route_table" "my_own_ng_rt" {
  vpc_id = module.my_own_vpc.aws_vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_own_ng.id
  }
  tags = {
    Name = "MY-OWN-RT-A"
  }
}

resource "aws_subnet" "my_own_private_subnet_a" {
  cidr_block        = "10.60.1.0/24"
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "MY-OWN-PRIVATE-SUBNET-1A"
  }
  vpc_id = module.my_own_vpc.aws_vpc_id
}

resource "aws_subnet" "my_own_private_subnet_b" {
  cidr_block        = "10.60.2.0/24"
  availability_zone = "${var.aws_region}b"
  tags = {
    Name = "MY-OWN-PRIVATE-SUBNET-1B"
  }
  vpc_id = module.my_own_vpc.aws_vpc_id
}

resource "aws_route_table_association" "route_table_associate_my_own_rt_a" {
  subnet_id      = aws_subnet.my_own_private_subnet_a.id
  route_table_id = aws_route_table.my_own_ng_rt.id
}

resource "aws_route_table_association" "route_table_associate_my_own_rt_b" {
  subnet_id      = aws_subnet.my_own_private_subnet_b.id
  route_table_id = aws_route_table.my_own_ng_rt.id
}
