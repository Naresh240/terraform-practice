variable "instance_type" {
    default = "t2.micro"
}

variable "ami_id" {
    default = "ami-0915bcb5fa77e4892"
}

variable "key_name" {
    default = "aws7am"
}

variable "instance_count" {
    default = 1
}

variable "ansible_host" {
    default = "ansible_host"
}

variable "ansible_user" {
    default = "ec2-user"
}

variable "ssh_file_path" {
    default = "aws7am.pem"
}

