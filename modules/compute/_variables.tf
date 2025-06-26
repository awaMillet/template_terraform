variable "env_str" {
  type        = string
  default     = ""
  description = "EC2 environment name"
}

variable "service_str" {
  type        = string
  default     = ""
  description = "EC2 service name"
}

variable "target_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "target_ami" {
  type        = string
  default     = "ami-0c1638aa346a43fe8" # amazonlinux2023
  description = "EC2 AMI ID"
}
variable "vpc_id_str" {
  type        = string
  description = "vpc id"
}

variable "target_subnet" {
  type        = string
  default     = ""
  description = "EC2 subnet"
}

variable "target_az" {
  type        = string
  default     = "ap-northeast-1a"
  description = "EC2 availability-zon"
}

variable "tag_name" {
  type        = string
  default     = "EC2 created by terraform"
  description = "EC2 tag name"
}
