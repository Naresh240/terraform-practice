data "aws_security_group" "example" {
  filter {
    name  = "tag:Name"
    values= ["allow_ssh"]
  }
}

resource "aws_instance" "example" {  
  count = var.number_of_instances

  ami             = var.image_id
  instance_type   = var.inst_type
  security_groups=[data.aws_security_group.example.name]

  tags = {
    Name = "${var.tag_name}-${count.index}"
  }
}
