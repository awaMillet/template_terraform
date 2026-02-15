variable "env_str" {
  type        = string
  description = "環境名"
}

variable "service_name" {
  type        = string
  description = "サービス名"
}

variable "cpu" {
  type        = string
  default     = "256"
  description = "タスクのCPUユニット数"
}

variable "memory" {
  type        = string
  default     = "512"
  description = "タスクのメモリ(MiB)"
}

variable "execution_role_arn" {
  type        = string
  description = "タスク実行ロールのARN"
}

variable "task_role_arn" {
  type        = string
  description = "タスクロールのARN"
}

variable "container_image" {
  type        = string
  description = "コンテナイメージ"
}

variable "environments" {
  type        = list(map(string))
  default     = []
  description = "環境変数"
}

variable "log_group_name" {
  type        = string
  description = "CloudWatchロググループ名"
}

variable "region" {
  type        = string
  description = "AWSリージョン"
}
