resource "aws_instance" "web" {
  count = length(var.inst_name)

  ami               = data.aws_ami.web.id
  instance_type     = var.inst_type
  security_groups   = var.security_group_names
  availability_zone = data.aws_availability_zones.available.names[count.index]
  key_name          = var.key_name

  tags = {
    Name = element(var.inst_name, count.index)
  }
}