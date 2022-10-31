resource "aws_internet_gateway" "my_own_vpc_gw" {
  vpc_id = module.my_own_vpc.aws_vpc_id

  tags = {
    Name = "my_own_gw"
  }
}

resource "aws_route_table" "my_own_public" {
  vpc_id = module.my_own_vpc.aws_vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_own_vpc_gw.id
  }

  tags = {
    Name = "MY-OWN-PUBLIC-RT"
  }
}

resource "aws_subnet" "my_own_public-1a" {
  cidr_block        = "10.60.50.0/24"
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "MY-OWN-PUBLIC-1A"
  }
  vpc_id = module.my_own_vpc.aws_vpc_id
}

resource "aws_subnet" "my_own_public-1b" {
  cidr_block        = "10.60.51.0/24"
  availability_zone = "${var.aws_region}b"
  tags = {
    Name = "MY-OWN-PUBLIC-1B"
  }
  vpc_id = module.my_own_vpc.aws_vpc_id
}

resource "aws_route_table_association" "route_table_associate_my_own_public-1a" {
  subnet_id      = aws_subnet.my_own_public-1a.id
  route_table_id = aws_route_table.my_own_public.id
}

resource "aws_route_table_association" "route_table_associate_my_own_public-1b" {
  subnet_id      = aws_subnet.my_own_public-1b.id
  route_table_id = aws_route_table.my_own_public.id
}