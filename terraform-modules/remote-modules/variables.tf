variable ingress_rules {
  type        = map(object({
    port = number
    description = string
  }))
  default = {
    key1 = {
        port = 22
        description = "SSH port"
    }
    key2 = {
        port = 80
        description = "HTTP port"
    }
  }
}

variable "inst_type" {
    type    = string
    default = "t2.micro"
}

variable "inst_name" {
    type    = list(string)
    default = ["Helloworld-0","Helloworld-1"]
}

variable "key_name" {
    type = string
    default = "awsdevops"
}
