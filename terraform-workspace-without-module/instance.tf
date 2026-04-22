resource "aws_instance" "example" {
  ami           = lookup(var.instance_ami, var.region)
  instance_type = var.instance_type
  key_name      = lookup(var.key_name, var.region)
  vpc_security_group_ids = [aws_security_group.example.id]

  tags = {
    Name        = "Helloworld",
    Environment = "Developemnt"
  }
}