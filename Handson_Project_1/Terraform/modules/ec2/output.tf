output "instance_ids" {
  value = [for instance in aws_instance.servers : instance.id]
}
