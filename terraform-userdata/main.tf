resource "aws_instance" "test" {
  ami           = lookup(var.ami_id,var.region)
  instance_type = var.instance_type
  key_name      = lookup(var.key_pair,var.region)
  count         = var.instance_count
  security_groups = ["${aws_security_group.ssh_port.name}"]
  availability_zone = element(var.availability_zones, count.index)
  user_data = "${file("install_httpd.sh")}"

  tags = {
    Name = "HelloWorld1"
  }
}