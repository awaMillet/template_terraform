variable "zone_id" {
  type        = string
  description = "The ID of the hosted zone to contain this record"
}

variable "name" {
  type        = string
  description = "The name of the record (e.g., 'db' for db.example.com)"
}

variable "type" {
  type        = string
  description = "The record type (A, AAAA, CNAME, MX, TXT, etc.)"
  default     = "A"
}

variable "ttl" {
  type        = number
  description = "The TTL of the record in seconds"
  default     = 300
}

variable "records" {
  type        = list(string)
  description = "List of record values (for non-alias records)"
  default     = []
}

variable "set_identifier" {
  type        = string
  description = "Unique identifier to differentiate records with routing policies"
  default     = null
}

variable "health_check_id" {
  type        = string
  description = "The health check ID to associate with this record"
  default     = null
}

# Alias record configuration
variable "alias" {
  type = object({
    name                   = string
    zone_id                = string
    evaluate_target_health = bool
  })
  description = "Alias configuration for alias records (e.g., for ALB, CloudFront)"
  default     = null
}

# Weighted routing policy
variable "weighted_routing_policy" {
  type = object({
    weight = number
  })
  description = "Weighted routing policy configuration"
  default     = null
}

# Geolocation routing policy
variable "geolocation_routing_policy" {
  type = object({
    continent   = optional(string)
    country     = optional(string)
    subdivision = optional(string)
  })
  description = "Geolocation routing policy configuration"
  default     = null
}

# Failover routing policy
variable "failover_routing_policy" {
  type = object({
    type = string # PRIMARY or SECONDARY
  })
  description = "Failover routing policy configuration"
  default     = null
}

# Latency routing policy
variable "latency_routing_policy" {
  type = object({
    region = string
  })
  description = "Latency routing policy configuration"
  default     = null
}
