resource "aws_security_group" "main" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}

resource "aws_security_group_rule" "ingress" {
  count = length(var.ingress_rules)

  security_group_id        = aws_security_group.main.id
  type                     = "ingress"
  description              = var.ingress_rules[count.index].description
  from_port                = var.ingress_rules[count.index].from_port
  to_port                  = var.ingress_rules[count.index].to_port
  protocol                 = var.ingress_rules[count.index].protocol
  cidr_blocks              = var.ingress_rules[count.index].cidr_blocks
  ipv6_cidr_blocks         = var.ingress_rules[count.index].ipv6_cidr_blocks
  source_security_group_id = var.ingress_rules[count.index].source_security_group_id
}

resource "aws_security_group_rule" "egress" {
  count = length(var.egress_rules)

  security_group_id        = aws_security_group.main.id
  type                     = "egress"
  description              = var.egress_rules[count.index].description
  from_port                = var.egress_rules[count.index].from_port
  to_port                  = var.egress_rules[count.index].to_port
  protocol                 = var.egress_rules[count.index].protocol
  cidr_blocks              = var.egress_rules[count.index].cidr_blocks
  ipv6_cidr_blocks         = var.egress_rules[count.index].ipv6_cidr_blocks
  source_security_group_id = var.egress_rules[count.index].source_security_group_id
}
