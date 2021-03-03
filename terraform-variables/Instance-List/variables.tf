variable "ami_id" {
  type = map
  default = {
    "us-east-1" = "ami-04d29b6f966df1537"
    "us-east-2" = "ami-09558250a3419e7d0"
  } 
}
variable "instance_count" {
  default = 2
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a","us-east-1b"]
}

variable "instance_tags" {
  type = list(string)
  default = ["HelloWorld-1","HelloWorld-2"]
}