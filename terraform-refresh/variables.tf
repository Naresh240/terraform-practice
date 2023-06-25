variable "image_id" {
  type    = map
  default = {
    "us-east-1" = "ami-022e1a32d3f742bd8"
    "us-east-2" = "ami-0e820afa569e84cc1"
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "key_pair" {
  type    = string
  default = "awsdevops"
}