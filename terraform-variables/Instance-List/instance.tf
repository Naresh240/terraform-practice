resource "aws_instance" "web" {
  ami               = lookup(var.ami_id,"us-east-1")
  instance_type     = "t2.micro"
  count             = var.instance_count
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = element(var.instance_tags, count.index)
  }
}