output "service_name" {
  value       = aws_ecs_service.main.name
  description = "ECSサービス名"
}
