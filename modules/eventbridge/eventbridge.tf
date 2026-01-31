# EventBridge
resource "aws_scheduler_schedule" "scheduler" {
  name       = "${var.env_str}-schedule-${var.service_str}"
  group_name = "default"
  state      = var.state

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = var.schedule_expression_str
  schedule_expression_timezone = "Asia/Tokyo"

  target {
    arn      = var.target_arn
    role_arn = aws_iam_role.eventbridge_scheduler.arn

    input = jsonencode({
      (var.target_type) = (var.target_instance)
    })

    retry_policy {
      maximum_retry_attempts = 10
    }
  }
}
