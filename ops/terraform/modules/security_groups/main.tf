resource "aws_security_group" "sg" {
  name   = var.name
  vpc_id = var.aws_vpc_id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = var.source_cidr_block
    }
  }

  tags = {
    Name = var.name
  }
}
