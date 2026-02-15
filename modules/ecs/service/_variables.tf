variable "env_str" {
  type        = string
  description = "環境名"
}

variable "service_name" {
  type        = string
  description = "サービス名"
}

variable "cluster_id" {
  type        = string
  description = "ECSクラスターのID"
}

variable "task_definition_arn" {
  type        = string
  description = "タスク定義のARN"
}

variable "desired_count" {
  type        = number
  default     = 1
  description = "希望するタスク数"
}

variable "assign_public_ip" {
  type        = bool
  default     = true
  description = "パブリックIPを割り当てるか"
}

variable "security_groups" {
  type        = list(string)
  description = "セキュリティグループIDのリスト"
}

variable "subnets" {
  type        = list(string)
  description = "サブネットIDのリスト"
}

variable "enable_execute_command" {
  type        = bool
  default     = true
  description = "ECS Execを有効にするか"
}
