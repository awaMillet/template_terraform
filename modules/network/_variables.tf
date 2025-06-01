variable "env_str" {
  type        = string
  default     = ""
  description = "VPC environment name"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC's cidr_block"
}

variable "subnet_a_cidr_block" {
  type        = string
  default     = "10.0.16.0/20"
  description = "subnet's cidr_block"
}

variable "subnet_c_cidr_block" {
  type        = string
  default     = "10.0.32.0/20"
  description = "subnet's cidr_block"
}

variable "subnet_d_cidr_block" {
  type        = string
  default     = "10.0.48.0/20"
  description = "subnet's cidr_block"
}
