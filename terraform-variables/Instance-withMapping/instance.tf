resource "aws_instance" "web" {
  ami           = lookup(var.ami_id,"us-east-1")
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}