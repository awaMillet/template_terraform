output "task_definition_arn" {
  value       = aws_ecs_task_definition.main.arn
  description = "タスク定義のARN"
}

output "task_definition_arn_without_revision" {
  value       = aws_ecs_task_definition.main.arn_without_revision
  description = "タスク定義のARN(リビジョンなし)"
}
