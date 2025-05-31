variable vpc_cidr_block {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC's cidr_block"
}

variable subnet_a_cidr_block {
  type        = string
  default     = "10.0.1.0/20"
  description = "subnet's cidr_block"
}
