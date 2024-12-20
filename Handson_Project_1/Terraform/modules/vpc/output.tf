output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [for s in aws_subnet.public : s.id]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [for s in aws_subnet.private : s.id]
}
