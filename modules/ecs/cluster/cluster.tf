# ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "${var.env_str}-${var.service_name}"

  # NOTE: Container Insightsを有効にするとCloudWatchカスタムメトリクスの追加課金が発生
  setting {
    name  = "containerInsights"
    value = var.enable_container_insights ? "enabled" : "disabled"
  }

  dynamic "configuration" {
    for_each = var.enable_execute_command_logging ? [1] : []
    content {
      execute_command_configuration {
        logging = "OVERRIDE"

        log_configuration {
          cloud_watch_log_group_name = var.cloudwatch_log_group
        }
      }
    }
  }

  tags = {
    Name = "${var.env_str}-${var.service_name}"
  }
}

## Capacity Providers
resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name       = aws_ecs_cluster.main.name
  capacity_providers = var.capacity_providers

  default_capacity_provider_strategy {
    capacity_provider = var.default_capacity_provider
    base              = var.default_capacity_provider_base
    weight            = var.default_capacity_provider_weight
  }
}
