module "ec2" {
  source = "./instance"

  region        = var.region
  instance_ami  = lookup(var.instance_ami, var.region)
  key_name      = lookup(var.key_name, var.region)
  instance_type = var.instance_type
  inst_count    = var.inst_count
}
