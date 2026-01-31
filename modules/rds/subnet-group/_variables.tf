variable "env_str" {
  type        = string
  default     = "dev"
  description = "RDS environment name"
}

variable "service_str" {
  type        = string
  default     = "sample"
  description = "RDS service name"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for RDS subnet group"
}
