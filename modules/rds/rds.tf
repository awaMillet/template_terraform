resource "aws_db_instance" "main" {
  # Database Engine
  engine                   = var.engine
  engine_version           = var.engine_version
  engine_lifecycle_support = "open-source-rds-extended-support-disabled"

  # Database configuration
  identifier            = "${var.service_str}-${var.env_str}-db"
  allocated_storage     = var.allocated_storage
  storage_type          = var.storage_type
  max_allocated_storage = var.max_allocated_storage
  instance_class        = var.instance_class
  db_name               = var.db_name
  username              = var.db_username
  password              = var.db_password
  parameter_group_name  = var.parameter_group_name

  # Network configuration
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.security_group_ids
  publicly_accessible    = var.publicly_accessible

  # Monitoring
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  monitoring_interval             = 60
  monitoring_role_arn             = var.monitoring_role_arn

  # Backup configuration
  backup_retention_period = 1
  backup_window           = "18:50-19:20"
  maintenance_window      = "fri:20:00-fri:20:30"
  copy_tags_to_snapshot   = true

  # Performance Insights
  performance_insights_enabled = true

  # Deletion protection
  deletion_protection = false
  skip_final_snapshot = true

  # Storage encryption
  storage_encrypted = true

  lifecycle {
    ignore_changes = [
      password
    ]
  }

  tags = {
    Name = "${var.service_str}-${var.env_str}-db"
  }
}

output "db_instance_identifier" {
  value       = aws_db_instance.main.identifier
  description = "The RDS instance identifier"
}

output "db_instance_arn" {
  value       = aws_db_instance.main.arn
  description = "The ARN of the RDS instance"
}

output "db_instance_endpoint" {
  value       = aws_db_instance.main.endpoint
  description = "The connection endpoint"
}

output "db_instance_address" {
  value       = aws_db_instance.main.address
  description = "The hostname of the RDS instance"
}
