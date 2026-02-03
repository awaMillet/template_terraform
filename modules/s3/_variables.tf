variable "env_str" {
  type        = string
  description = "Environment name (e.g., dev, stg, prd)"
}

variable "service_name" {
  type        = string
  description = "Service name for resource naming"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name (must be globally unique)"
}

variable "versioning_enabled" {
  type        = bool
  default     = false
  description = "Whether to enable versioning"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Whether to allow bucket deletion even if it contains objects (use with caution)"
}

# Lifecycle rules
variable "lifecycle_rules" {
  type = list(object({
    id                                     = string
    enabled                                = bool
    prefix                                 = optional(string)
    expiration_days                        = optional(number)
    noncurrent_version_expiration_days     = optional(number)
    transition_days                        = optional(number)
    transition_storage_class               = optional(string)
    noncurrent_version_transition_days     = optional(number)
    noncurrent_version_transition_storage_class = optional(string)
  }))
  default     = []
  description = "List of lifecycle rules"
}

# Bucket policy
variable "bucket_policy" {
  type        = string
  default     = null
  description = "Bucket policy JSON string"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags for the S3 bucket"
}
