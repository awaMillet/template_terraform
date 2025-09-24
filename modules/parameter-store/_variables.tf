variable "parameter_name" {
  type        = string
  description = "service name"
}

variable "tag_name" {
  type        = string
  default     = "ParameterStore created by terraform"
  description = "ParameterStore tag name"
}
