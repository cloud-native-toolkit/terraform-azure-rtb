module "nsg" {
  source = "./module"

  name_prefix           = "${local.name_prefix}"
  resource_group_name   = module.resource_group.name
  virtual_network_name  = module.vnet.name
  region                = module.resource_group.region
  subnet_ids            = module.subnets.ids
 
  acl_rules = [{
    name                = "ssh-inbound"
    priority            = "101"
    access              = "Allow"
    protocol            = "Tcp"
    direction           = "Inbound"
    source_addr         = "*"
    destination_addr    = "*"
    source_ports        = "*"
    destination_ports   = "22"
  }]
}

module "rtb" {
   source = "./module"

   name_prefix          = "${local.name_prefix}"
   resource_group_name  = module.resource_group.name
   region               = module.resource_group.region
   subnet_ids           = module.subnets.ids
   routes = []
}
