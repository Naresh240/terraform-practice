module securitygroup {
  source = "git::https://github.com/Naresh240/securitygroup_terraform_module.git?ref=main"

  ingress_rules  = var.ingress_rules  
}

module instance {
  source = "git::https://github.com/Naresh240/instance_terraform_module.git?ref=master"

  inst_type = var.inst_type
  inst_name = var.inst_name
  key_name = var.key_name
  security_group_names = module.securitygroup.sg_names

  depends_on = [module.securitygroup]
}
