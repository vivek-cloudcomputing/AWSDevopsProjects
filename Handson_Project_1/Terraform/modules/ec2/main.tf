resource "aws_instance" "servers" {
  for_each      = tomap(var.instances)
  ami           = each.value.ami
  instance_type = each.value.type
  key_name      = var.key_name
  subnet_id     = each.value.subnet_id

  tags = {
    Name = each.value.name
  }
}