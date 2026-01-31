output "repository_url" {
  value       = aws_ecr_repository.main.repository_url
  description = "ECRリポジトリのURL"
}

output "repository_arn" {
  value       = aws_ecr_repository.main.arn
  description = "ECRリポジトリのARN"
}

output "repository_name" {
  value       = aws_ecr_repository.main.name
  description = "ECRリポジトリ名"
}

output "registry_id" {
  value       = aws_ecr_repository.main.registry_id
  description = "ECRレジストリID"
}
