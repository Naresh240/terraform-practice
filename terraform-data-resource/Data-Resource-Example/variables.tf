variable "image_id" {
  type    = string
  default = "ami-019f9b3318b7155c5"
}

variable "inst_type" {
  type    = string
  default = "t2.micro"
}

variable "tag_name" {
  type    = string
  default = "Helloworld"
}

variable "number_of_instances" {
  type    = number
  default = 1
}
