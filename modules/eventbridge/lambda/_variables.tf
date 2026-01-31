variable "env_str" {
  type        = string
  default     = "dev"
  description = "environment name"
}

variable "service_str" {
  type        = string
  default     = "sample"
  description = "service name"
}

variable "schedule_expression_str" {
  type        = string
  description = "schedule expression (e.g., cron(0 4 * * ? *))"
}

variable "lambda_arn" {
  type        = string
  description = "ARN of the Lambda function to invoke"
}

variable "maximum_retry_attempts" {
  type        = number
  default     = 3
  description = "Maximum retry attempts on failure"
}

variable "state" {
  type        = string
  default     = "ENABLED"
  description = "スケジュールの状態 (ENABLED または DISABLED)"
  validation {
    condition     = contains(["ENABLED", "DISABLED"], var.state)
    error_message = "state must be either 'ENABLED' or 'DISABLED'"
  }
}
