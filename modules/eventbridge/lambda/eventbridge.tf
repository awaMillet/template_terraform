# EventBridge Scheduler for Lambda
resource "aws_scheduler_schedule" "lambda" {
  name       = "${var.env_str}-schedule-${var.service_str}"
  group_name = "default"
  state      = var.state

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = var.schedule_expression_str
  schedule_expression_timezone = "Asia/Tokyo"

  target {
    arn      = var.lambda_arn
    role_arn = aws_iam_role.eventbridge_scheduler.arn

    retry_policy {
      maximum_retry_attempts = var.maximum_retry_attempts
    }
  }
}
