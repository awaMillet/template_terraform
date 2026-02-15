output "cluster_id" {
  value       = aws_ecs_cluster.main.id
  description = "ECSクラスターのID"
}

output "cluster_arn" {
  value       = aws_ecs_cluster.main.arn
  description = "ECSクラスターのARN"
}

output "cluster_name" {
  value       = aws_ecs_cluster.main.name
  description = "ECSクラスター名"
}
