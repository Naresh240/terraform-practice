locals {
  ingress_rules = [{
    port    = 22
    description = "SSH port"
  },
  {
    port    = 80
    description = "HTTP port"    
  }]
}

resource "aws_security_group" "main" {
  name     = "allow_ports"

  dynamic "ingress" {
    for_each  = local.ingress_rules

    content {
      description      = ingress.value.description
      from_port        = ingress.value.port
      to_port          = ingress.value.port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }
  tags = {
    Name = "ssh_security_group"
  }
}
resource "aws_instance" "web" {
  ami           = var.image_id
  instance_type = var.inst_type
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = "HelloWorld"
  }
}