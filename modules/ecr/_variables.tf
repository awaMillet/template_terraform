variable "env_str" {
  type        = string
  default     = "dev"
  description = "environment name"
}

variable "repository_name" {
  type        = string
  description = "ECRリポジトリ名"
}

variable "image_tag_mutability" {
  type        = string
  default     = "MUTABLE"
  description = "イメージタグの変更可否(MUTABLE or IMMUTABLE)"
}

variable "scan_on_push" {
  type        = bool
  default     = true
  description = "プッシュ時にイメージスキャンを実行するか"
}

variable "encryption_type" {
  type        = string
  default     = "AES256"
  description = "暗号化タイプ(AES256 or KMS)"
}

variable "kms_key_arn" {
  type        = string
  default     = null
  description = "KMS暗号化を使用する場合のKMSキーARN"
}

variable "lifecycle_policy_count" {
  type        = number
  default     = 30
  description = "保持するイメージの最大数"
}

variable "force_delete" {
  type        = bool
  default     = false
  description = "イメージが存在してもリポジトリを削除するか"
}
