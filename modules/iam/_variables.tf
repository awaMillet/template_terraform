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

variable "role_name" {
  type        = string
  description = "IAM role name"
}

variable "assume_role_service" {
  type        = string
  description = "AWS service that can assume this role (e.g., lambda.amazonaws.com)"
}

variable "managed_policy_arns" {
  type        = list(string)
  default     = []
  description = "List of managed policy ARNs to attach to the role"
}

variable "inline_policy_name" {
  type        = string
  default     = ""
  description = "Name of the inline policy"
}

variable "inline_policy" {
  type        = string
  default     = ""
  description = "Inline policy JSON document"
}
