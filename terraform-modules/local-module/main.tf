module securitygroup {
  source = "./modules/securitygroup"

  ingress_rules  = var.ingress_rules
}

module instance {
    source = "./modules/instance"

    inst_type = var.inst_type
    inst_name = var.inst_name
    key_name = var.key_name
    security_group_names = module.securitygroup.sg_names

    depends_on = [module.securitygroup]
}