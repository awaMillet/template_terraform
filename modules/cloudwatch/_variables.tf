variable "env_str" {
  type        = string
  default     = "dev"
  description = "環境名 (dev, stg, prdなど)"
}

variable "service_name" {
  type        = string
  description = "サービス名"
}

variable "retention_in_days" {
  type        = number
  default     = 90
  description = "ログの保持日数"
}

variable "log_stream_name" {
  type        = string
  default     = ""
  description = "ログストリーム名"
}
