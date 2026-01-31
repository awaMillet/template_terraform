variable "env_str" {
  type        = string
  default     = ""
  description = "Environment name"
}

variable "service_str" {
  type        = string
  default     = "sample"
  description = "Service name"
}

variable "domain_name" {
  type        = string
  description = "Domain name for the hosted zone"
}

variable "is_private" {
  type        = bool
  default     = false
  description = "Whether this is a private hosted zone (true) or public (false)"
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "VPC ID to associate with private hosted zone (required if is_private is true)"
}

variable "comment" {
  type        = string
  default     = ""
  description = "Comment for the hosted zone"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags for the hosted zone"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Whether to destroy all records in the zone when destroying the zone"
}
