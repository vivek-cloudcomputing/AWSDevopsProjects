output "instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = [for instance in aws_instance.servers : instance.id]
}
