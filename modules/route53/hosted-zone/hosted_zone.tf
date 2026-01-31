resource "aws_route53_zone" "main" {
  name          = var.domain_name
  comment       = var.comment != "" ? var.comment : "Managed by Terraform - ${var.env_str} environment"
  force_destroy = var.force_destroy

  dynamic "vpc" {
    for_each = var.is_private && var.vpc_id != null ? [1] : []
    content {
      vpc_id = var.vpc_id
    }
  }

  tags = merge(
    {
      Name = "${var.service_str}-${var.env_str}-${var.is_private ? "private" : "public"}-vpc-zone"
    },
    var.tags
  )
}
