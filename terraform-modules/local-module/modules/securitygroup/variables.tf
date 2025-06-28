variable ingress_rules {
  type        = map(object({
    port = number
    description = string
  }))
  default = {}
}
