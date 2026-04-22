variable "region" {
  type = string
}

variable "instance_ami" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "inst_count" {
  type    = number
  default = 1
}

variable "vpc_name_tag" {
  type    = string
  default = "Helloworld"
}
