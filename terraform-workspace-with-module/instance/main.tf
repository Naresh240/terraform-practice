data "aws_vpc" "demo" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name_tag]
  }
}

resource "aws_security_group" "example" {
  name        = "allow_ssh-${var.region}"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.demo.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh-${var.region}"
  }
}

resource "aws_instance" "example" {
  count = var.inst_count

  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.example.id]

  tags = {
    Name        = "Helloworld-${var.region}"
    Environment = "Development"
  }
}
