output "function_arn" {
  value       = aws_lambda_function.main.arn
  description = "ARN of the Lambda function"
}

output "function_name" {
  value       = aws_lambda_function.main.function_name
  description = "Name of the Lambda function"
}
