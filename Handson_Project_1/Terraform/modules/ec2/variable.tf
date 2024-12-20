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
  description = "Name of the key pair"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for security group"
  type        = string
}
