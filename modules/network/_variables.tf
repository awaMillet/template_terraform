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

variable "public_subnet_a_cidr_block" {
  type        = string
  default     = "10.0.16.0/20"
  description = "subnet's cidr_block"
}

variable "public_subnet_c_cidr_block" {
  type        = string
  default     = "10.0.32.0/20"
  description = "subnet's cidr_block"
}

variable "public_subnet_d_cidr_block" {
  type        = string
  default     = "10.0.48.0/20"
  description = "subnet's cidr_block"
}

variable "private_subnet_a_cidr_block" {
  type        = string
  default     = "10.0.64.0/20"
  description = "subnet's cidr_block"
}

variable "private_subnet_c_cidr_block" {
  type        = string
  default     = "10.0.80.0/20"
  description = "subnet's cidr_block"
}

variable "private_subnet_d_cidr_block" {
  type        = string
  default     = "10.0.96.0/20"
  description = "subnet's cidr_block"
}
