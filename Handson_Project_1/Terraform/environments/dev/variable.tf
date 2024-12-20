variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = map(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = map(string)
}

variable "key_name" {
  description = "Key pair for EC2 instances"
  type        = string
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
