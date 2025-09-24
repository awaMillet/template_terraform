resource "aws_ssm_parameter" "parameter" {
  name  = var.parameter_name
  type  = "SecureString"
  value = "dummy"

  lifecycle {
    ignore_changes = [
      value
    ]
  }

  tags = {
    Name = var.tag_name
  }
}
