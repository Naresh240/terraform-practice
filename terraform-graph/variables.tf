variable instance_ami {
  type        = string
  default     = "ami-098e39bafa7e7303d"
  description = "AMI of EC2 Instance"
}

variable instance_type {
  type        = string
  default     = "t3.micro"
  description = "Instance type example: t3.micro, t3.samll..,"
}

variable key_name {
    type = string
    default = "awsdevops"
}