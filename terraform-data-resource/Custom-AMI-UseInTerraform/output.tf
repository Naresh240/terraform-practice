output "aws_security_group" {
  value = data.aws_security_group.sg.id
}

output "ip" {
  value = aws_instance.web.*.public_ip
}

output "aws_vpc_id" {
  value = data.aws_vpc.example.id
}