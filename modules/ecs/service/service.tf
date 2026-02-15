resource "aws_ecs_service" "main" {
  name                              = "${var.env_str}-${var.service_name}"
  cluster                           = var.cluster_id
  task_definition                   = var.task_definition_arn
  desired_count                     = var.desired_count
  launch_type                       = "FARGATE"
  platform_version                  = "LATEST"
  enable_execute_command            = var.enable_execute_command
  health_check_grace_period_seconds = 0

  network_configuration {
    assign_public_ip = var.assign_public_ip
    security_groups  = var.security_groups
    subnets          = var.subnets
  }

  lifecycle {
    ignore_changes = [task_definition]
  }
}
