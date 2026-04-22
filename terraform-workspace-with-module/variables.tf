variable "instance_ami" {
  type        = map(string)
  default     = {
   "us-east-1" = "ami-098e39bafa7e7303d"
   "us-east-2" = "ami-0a1b6a02658659c2a"
   "us-west-1" = "ami-02671e999eec7752f"
  }
  description = "AMI of EC2 Instance"
}

variable "key_name" {
  type    = map(string)
  default = {
    "us-east-1" = "awsdevops"
    "us-east-2" = ""
  }
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Instance type example: t3.micro, t3.samll..,"
}



variable "inst_count" {
  type = number
}

variable "region" {
  type = string
  validation {
    condition     = contains(keys(var.instance_ami), var.region)
    error_message = "region must be one of the keys in var.instance_ami"
  }
}
