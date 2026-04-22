output "public_ips" {
    value = {
        public_ips = module.ec2.public_ips
    }
}

output "security_group_id" {
    value = {
        security_group_id = module.ec2.security_group_id
    }
}