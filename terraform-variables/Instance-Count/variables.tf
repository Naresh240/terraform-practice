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
