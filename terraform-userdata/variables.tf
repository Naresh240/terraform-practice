variable "ami_id" {
  type = map
  default = {
      "us-east-1" = "ami-0ab4d1e9cf9a1215a",
      "us-east-2" = "ami-0277b52859bac6f4b"
  }
}
variable "region" {
  type = string
  default = "us-east-2"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "availability_zones" {
  type    = list(string)
  default = ["us-east-2a","us-east-2b"]
}
variable "key_pair" {
  type = map
  default = {
      "us-east-1" = "awsdevops",
      "us-east-2" = "asg"
  }
}
variable "instance_count" {
  type = string
  default = 1
}