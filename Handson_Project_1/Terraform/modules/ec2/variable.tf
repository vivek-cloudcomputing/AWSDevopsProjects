variable "instances" {
  description = "Map of instance configurations"
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
  description = "Key pair name for EC2 instances"
  type        = string
}