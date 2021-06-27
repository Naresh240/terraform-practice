data "aws_vpc" "example" {
  filter {
    name  = "tag:Name"
    values= ["default"]
  }
}

data "aws_security_group" "sg" {
  filter {
    name  = "group-name"
    values= ["launch-wizard-4"]
  }
}

data "aws_ami" "example" {
  most_recent = true
  owners = ["self"]
  filter {
    name   = "tag:Name"
    values = ["httpd"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  key_name      = var.key_pair

  tags = {
    Name = "HelloWorld"
  }
}