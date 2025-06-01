resource "aws_ssm_parameter" "parameter" {
  count = 2
  name  = "parameter${count.index + 1}"
  type  = "SecureString"
  value = "dummy"

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}
