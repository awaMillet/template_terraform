variable "env_str" {
  type        = string
  default     = ""
  description = "RDS environment name"
}

variable "service_str" {
  type        = string
  default     = "sample"
  description = "RDS service name"
}

# Database Engine
variable "engine" {
  type        = string
  description = "Database engine (mysql, postgres, etc.)"
}

variable "engine_version" {
  type        = string
  description = "Database engine version"
}

# Database configuration
variable "db_name" {
  type        = string
  default     = ""
  description = "Database name"
}

variable "db_username" {
  type        = string
  sensitive   = true
  default     = "admin"
  description = "Database master username"
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Database master password"
}

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "RDS instance class"
}

variable "storage_type" {
  type        = string
  default     = "gp3"
  description = "database storage type"
}

variable "allocated_storage" {
  type        = number
  default     = 20
  description = "Allocated storage in GB"
}

variable "max_allocated_storage" {
  type        = number
  default     = 500
  description = "Max Allocated storage in GB"
}

variable "parameter_group_name" {
  type        = string
  description = "Database parameter group name"
}

# Network configuration
variable "db_subnet_group_name" {
  type        = string
  description = "RDS subnet group name"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to attach to RDS instance"
}

variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "public access"
}

# Monitoring
variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  default     = []
  description = "List of log types to export to CloudWatch (mysql: error, general, slowquery; postgres: postgresql, upgrade)"
}

variable "monitoring_role_arn" {
  type        = string
  description = "ARN of the IAM role for RDS enhanced monitoring"
}
