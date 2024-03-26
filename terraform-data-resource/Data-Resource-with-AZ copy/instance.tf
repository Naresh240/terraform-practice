resource "aws_instance" "example" {
  
  count = var.number_of_instances

  ami             = var.image_id
  instance_type   = var.inst_type
  security_groups = [aws_security_group.ssh_port.name]
  availability_zone = data.aws_availability_zones.example.names[count.index]

  tags = {
    Name = "${var.tag_name}-${count.index}"
  }

  depends_on = [
    aws_security_group.ssh_port
  ]
}