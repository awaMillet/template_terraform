output "security_group_id" {
  value       = aws_security_group.main.id
  description = "The ID of the security group"
}

output "security_group_arn" {
  value       = aws_security_group.main.arn
  description = "The ARN of the security group"
}

output "security_group_name" {
  value       = aws_security_group.main.name
  description = "The name of the security group"
}

output "security_group_vpc_id" {
  value       = aws_security_group.main.vpc_id
  description = "The VPC ID of the security group"
}
