variable "env_str" {
  type        = string
  default     = ""
  description = "environment name"
}

variable "service_str" {
  type        = string
  default     = "sample"
  description = "service name"
}

variable "description" {
  type        = string
  default     = ""
  description = "Lambdaの説明"
}

# Package Type
variable "package_type" {
  type        = string
  default     = "Zip"
  description = "Lambdaのパッケージタイプ(Zip または Image)"
  validation {
    condition     = contains(["Zip", "Image"], var.package_type)
    error_message = "package_type must be either 'Zip' or 'Image'"
  }
}

variable "runtime" {
  type        = string
  default     = "python3.13"
  description = "Lambdaのランタイム(package_type = Zip の場合に必須)"
}

variable "handler" {
  type        = string
  default     = "main.lambda_handler"
  description = "Lambdaのハンドラー(package_type = Zip の場合に必須)"
}

variable "image_uri" {
  type        = string
  default     = null
  description = "コンテナイメージのURI(package_type = Image の場合に必須)"
}

variable "memory_size" {
  type        = number
  default     = 128
  description = "Lambdaのメモリサイズ(MB)"
}

variable "ephemeral_storage" {
  type        = number
  default     = 512
  description = "Lambdaの一時ストレージサイズ(MB)"
}

variable "architectures" {
  type        = string
  default     = "arm64"
  description = "Lambdaのアーキテクチャ"
}

variable "timeout" {
  type        = number
  default     = 300
  description = "タイムアウト値"
}

# VPC
variable "vpc_id" {
  type        = string
  default     = null
  description = "Lambdaの配置するVPC"
}

variable "subnet_ids" {
  type        = list(string)
  default     = null
  description = "Lambdaの配置するサブネット"
}

variable "security_group_ids" {
  type        = list(string)
  default     = null
  description = "VPCに配置するLambdaのセキュリティグループ"
}
