variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "instances" {
  description = "Map of EC2 instance configurations"
  type = map(
    object({
      name      = string
      ami       = string
      type      = string
      subnet_id = string
    })
  )
}

variable "key_name" {
  description = "Key pair for EC2 instances"
  type        = string
}
