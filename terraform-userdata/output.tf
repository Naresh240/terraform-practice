output "instance_ip_addr" {
  value = aws_instance.test.*.private_ip
}