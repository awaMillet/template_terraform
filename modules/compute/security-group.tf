# Security Group
resource "aws_security_group" "ec2" {
  name   = "${var.service_str}-${var.env_str}-sg"
  vpc_id = var.vpc_id_str

  tags = {
    Name = "${var.service_str}-${var.env_str}-sg"
  }
}

resource "aws_security_group_rule" "ec2_egress_anywhere" {
  security_group_id = aws_security_group.ec2.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0

  cidr_blocks = [
    "0.0.0.0/0"
  ]

  ipv6_cidr_blocks = [
    "::/0"
  ]
}

resource "aws_security_group_rule" "ec2_ingress_80" {
  security_group_id = aws_security_group.ec2.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80

  cidr_blocks = [
    "0.0.0.0/0"
  ]

  ipv6_cidr_blocks = [
    "::/0"
  ]
}

resource "aws_security_group_rule" "ec2_ingress_443" {
  security_group_id = aws_security_group.ec2.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443

  cidr_blocks = [
    "0.0.0.0/0"
  ]

  ipv6_cidr_blocks = [
    "::/0"
  ]
}
