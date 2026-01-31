variable "vpc_id" {
  type        = string
  description = "VPC ID where the security group will be created"
}

variable "name" {
  type        = string
  description = "Name of the security group"
}

variable "description" {
  type        = string
  default     = "Managed by Terraform"
  description = "Description of the security group"
}

variable "ingress_rules" {
  type = list(object({
    description              = string
    from_port                = number
    to_port                  = number
    protocol                 = string
    cidr_blocks              = optional(list(string), [])
    ipv6_cidr_blocks         = optional(list(string), [])
    source_security_group_id = optional(string, null)
  }))
  default     = []
  description = "List of ingress rules"
}

variable "egress_rules" {
  type = list(object({
    description              = string
    from_port                = number
    to_port                  = number
    protocol                 = string
    cidr_blocks              = optional(list(string), [])
    ipv6_cidr_blocks         = optional(list(string), [])
    source_security_group_id = optional(string, null)
  }))
  default = [
    {
      description      = "Allow all outbound traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]
  description = "List of egress rules"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags for the security group by Terraform"
}
