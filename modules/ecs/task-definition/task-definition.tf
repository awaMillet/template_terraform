resource "aws_ecs_task_definition" "main" {
  family                   = "${var.env_str}-${var.service_name}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  # container_definitions = sensitive(data.aws_ecs_task_definition.latest.container_definitions)
  #### ---- 手動で更新したタスク定義をterraform管理下に置く場合は、以下コメントアウト
  container_definitions = jsonencode([
    {
      name        = var.service_name
      image       = var.container_image
      essential   = true
      environment = var.environments
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = var.log_group_name
          "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])

  # 環境変数を変更しても再作成されないようにしているがロググループ名などの変更も検知されないので注意
  lifecycle {
    ignore_changes = [
      container_definitions
    ]
  }
  #### ---- ここまでコメントアウト

  skip_destroy = true
}

data "aws_ecs_task_definition" "latest" {
  task_definition = "${var.env_str}-${var.service_name}"
}
