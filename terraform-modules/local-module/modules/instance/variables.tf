variable "inst_type" {
    type    = string
}

variable "inst_name" {
    type    = list(string)
}

variable "key_name" {
    type = string
}

variable "security_group_names" {
    type = list(string)
}