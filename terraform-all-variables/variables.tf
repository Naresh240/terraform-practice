variable "ami_id" {
  type = map
  default = {
    "us-east-1" = "ami-0d5eff06f840b45e9"
    "us-east-2" = "ami-077e31c4939f6a2f3"
  }
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "awsdevopskey"
}

variable "instance_count" {
  default = 2
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a","us-east-1b"]
}