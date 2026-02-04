variable "env_str" {
  type        = string
  default     = ""
  description = "EC2 environment name"
}

variable "service_str" {
  type        = string
  default     = "SAMPLE"
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

variable "user_data" {
  description = "The user data to provide when launching the instance"
  type        = string
  default     = null
}

# Root block device settings
variable "root_volume_type" {
  type        = string
  default     = "gp3"
  description = "Root block device volume type (e.g., gp2, gp3, io1, io2)"
}

variable "root_volume_size" {
  type        = number
  default     = 100
  description = "Root block device volume size in GB"
}

variable "root_volume_iops" {
  type        = number
  default     = 3000
  description = "Root block device IOPS (only for gp3, io1, io2)"
}

