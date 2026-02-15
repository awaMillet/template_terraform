variable "env_str" {
  type        = string
  default     = "dev"
  description = "環境名"
}

variable "service_name" {
  type        = string
  default     = "sample"
  description = "サービス名"
}

variable "capacity_providers" {
  type        = list(string)
  default     = ["FARGATE", "FARGATE_SPOT"]
  description = "キャパシティプロバイダーのリスト(FARGATE, FARGATE_SPOT等)"
}

variable "default_capacity_provider" {
  type        = string
  default     = "FARGATE"
  description = "デフォルトのキャパシティプロバイダー"
}

variable "default_capacity_provider_base" {
  type        = number
  default     = 0
  description = "デフォルトプロバイダーのベースタスク数"
}

variable "default_capacity_provider_weight" {
  type        = number
  default     = 1
  description = "デフォルトプロバイダーのウェイト"
}

# NOTE: Container Insights を有効にすると CloudWatch カスタムメトリクスの追加課金が発生
# 料金詳細: https://aws.amazon.com/jp/cloudwatch/pricing/
variable "enable_container_insights" {
  type        = bool
  default     = false
  description = "Container Insights の有効化(有効にするとCloudWatchの追加課金が発生)"
}

variable "enable_execute_command_logging" {
  type        = bool
  default     = true
  description = "ECS Execのログ記録を有効にするか"
}

variable "cloudwatch_log_group" {
  type        = string
  default     = ""
  description = "ECS ExecのCloudWatchロググループ名"
}
