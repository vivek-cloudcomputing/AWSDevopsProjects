resource "aws_security_group" "ec2_sg" {
  name_prefix = "ec2-sg-"
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc_id

  # Allow SSH from anywhere
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Jenkins access (8080) from anywhere
  ingress {
    description = "Allow Jenkins access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-security-group"
  }
}

resource "aws_instance" "servers" {
  for_each      = var.instances
  ami           = each.value.ami
  instance_type = each.value.type
  key_name      = var.key_name

  # Dynamically resolve subnet ID
  subnet_id = each.value.subnet_id == "public" ? var.public_subnet_ids[0] : var.private_subnet_ids[0]

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = each.value.name
  }
}
