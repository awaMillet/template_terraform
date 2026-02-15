resource "aws_cloudwatch_log_group" "main" {
  name              = "/ecs/${var.env_str}-${var.service_name}"
  retention_in_days = var.retention_in_days

  tags = {
    Name = "${var.env_str}-${var.service_name}-logs"
  }
}

resource "aws_cloudwatch_log_stream" "main" {
  count          = var.log_stream_name != "" ? 1 : 0
  name           = var.log_stream_name
  log_group_name = aws_cloudwatch_log_group.main.name
}
