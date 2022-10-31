resource "aws_elb" "elb_my_own" {
  name            = "elb-my-own"
  subnets         = [aws_subnet.my_own_public-1a.id, aws_subnet.my_own_public-1b.id]
  internal        = true
  security_groups = [module.sg_http_only.sg, module.sg_https_only.sg]

  listener {
    instance_port     = 25672
    instance_protocol = "tcp"
    lb_port           = 25672
    lb_protocol       = "tcp"
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 300
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = "elb-my-own"
  }
}

resource "aws_route53_record" "route53_record" {
  zone_id = var.route53_zone_id
  name    = "my-own.litanshamir.com"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_elb.elb_my_own.dns_name]
}