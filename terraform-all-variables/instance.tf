resource "aws_instance" "web" {
  ami           = lookup(var.ami_id,var.region)
  instance_type = var.instance_type
  key_name 		= var.key_name
  security_groups = ["${aws_security_group.ssh_port.name}"]
  count         = var.instance_count
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "HelloWorld"
  }
}

output "ip" {
  value = aws_instance.web.*.public_ip
}