data "aws_vpc" "example" {
  filter {
    name  = "tag:Name"
    values= ["default"]
  }
}

data "aws_security_group" "sg" {
  filter {
    name  = "group-name"
    values= ["terraform-data-sg"]
  }
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]

  tags = {
    Name = "HelloWorld"
  }
}