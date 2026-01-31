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
  description = "schedule expression"
}

variable "target_arn" {
  type        = string
  description = "target for EventBridge"
}

variable "target_type" {
  type        = string
  default     = "InstanceIds"
  description = "target type"
}

variable "target_instance" {
  type        = any
  default     = []
  description = "target instance IDs in list format (for EC2)"
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
