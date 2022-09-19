module "rtb" {
   source = "./module"

   name_prefix          = "${local.name_prefix}"
   resource_group_name  = module.resource_group.name
   region               = module.resource_group.region
   subnet_ids           = module.subnets.ids
   routes = []
}
