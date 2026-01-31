locals {
  tmpl_dir = "../../template"
}

# EventBridge
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
  name = "${title(var.env_str)}-EventBridge-Scheduler-Execution-Policy"
  role = aws_iam_role.eventbridge_scheduler.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AutomationEC2"
        Effect = "Allow"
        Action = [
          "ec2:StartInstances",
          "ec2:StopInstances"
        ]
        Resource = [
          "arn:aws:ec2:ap-northeast-1:${data.aws_caller_identity.current.account_id}:instance/*"
        ]
      },
      {
        Sid    = "AutomationRDS"
        Effect = "Allow"
        Action = [
          "rds:StartDBInstance",
          "rds:StopDBInstance"
        ]
        Resource = [
          "arn:aws:rds:ap-northeast-1:${data.aws_caller_identity.current.account_id}:db:*"
        ]
      }
    ]
  })
}
