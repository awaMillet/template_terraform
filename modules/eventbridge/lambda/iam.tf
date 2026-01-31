locals {
  tmpl_dir = "../../template"
}

# IAM Role for EventBridge Scheduler
resource "aws_iam_role" "eventbridge_scheduler" {
  name = "${title(var.env_str)}-${upper(var.service_str)}-EventBridgeSchedulerRole"
  assume_role_policy = templatefile("${local.tmpl_dir}/iam-policy-trust-rel.json", {
    service = "scheduler.amazonaws.com"
  })
}

resource "aws_iam_role_policies_exclusive" "eventbridge_scheduler" {
  role_name = aws_iam_role.eventbridge_scheduler.name
  policy_names = [
    aws_iam_role_policy.eventbridge_scheduler.name
  ]
}

resource "aws_iam_role_policy" "eventbridge_scheduler" {
  name = "${title(var.env_str)}-EventBridge-Scheduler-Lambda-Policy"
  role = aws_iam_role.eventbridge_scheduler.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "InvokeLambda"
        Effect = "Allow"
        Action = [
          "lambda:InvokeFunction"
        ]
        Resource = [
          var.lambda_arn,
          "${var.lambda_arn}:*"
        ]
      }
    ]
  })
}
