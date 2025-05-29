resource "aws_ssm_parameter" "リソース名" {
  name  = "パラメーターストア名"
  type  = "SecureString"
  value = "dummy"

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}
