# Lambda
resource "aws_lambda_function" "main" {
  function_name = "${var.env_str}_${var.service_str}"
  description   = var.description
  package_type  = var.package_type
  role          = module.lambda_iam.role_arn
  memory_size   = var.memory_size
  timeout       = var.timeout

  # Zip type only
  runtime  = var.package_type == "Zip" ? var.runtime : null
  filename = var.package_type == "Zip" ? data.archive_file.dummy_lambda.output_path : null
  handler  = var.package_type == "Zip" ? var.handler : null
  layers   = var.package_type == "Zip" ? [] : null

  # Image type only
  image_uri = var.package_type == "Image" ? var.image_uri : null

  environment {
    variables = {
      SLACK_WEBHOOK_URL = ""
    }
  }

  ephemeral_storage {
    size = var.ephemeral_storage
  }

  logging_config {
    log_format = "Text"
    log_group  = aws_cloudwatch_log_group.lambda_log_group.name
  }

  architectures = [
    var.architectures
  ]

  lifecycle {
    ignore_changes = [
      layers,
      filename,
      environment,
      image_uri
    ]
  }

  dynamic "vpc_config" {
    for_each = var.subnet_ids != null && length(var.subnet_ids) > 0 ? [1] : []
    content {
      subnet_ids         = var.subnet_ids
      security_group_ids = var.security_group_ids
    }
  }

  tags = {
    Name = "${var.env_str}-${var.service_str}-lambda"
  }
}
