data "aws_availability_zones" "available" {}

resource "aws_instance" "web" {
  count         = 2
  ami           = lookup(var.image_id,var.region)
  instance_type = var.instance_type
  key_name      = var.key_pair
  availability_zone = data.aws_availability_zones.available.names[count.index]
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "HelloWorld${count.index}"
  }
  depends_on = [
    aws_security_group.allow_ssh
  ]
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow ssh port to connect ec2 instances"

  ingress {
    description      = "allow ssh port"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "allow ssh port"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}