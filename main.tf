/******************************************
	            Virtual Network
 *****************************************/
module "vnet" {
  source = "./modules/virtual-network"
  env    = var.env

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  vnet_name               = var.vnet_name
  address_space           = var.vnet_address_space
  vnet_dns_servers        = var.vnet_dns_servers

  common_tags = var.common_tags
}

/******************************************
	                Subnets
 *****************************************/
module "subnets" {
  source = "./modules/subnets"

  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  subnets             = var.subnets

  depends_on = [module.vnet]
}

/******************************************
	                Routes
 *****************************************/
module "routes" {
  source = "./modules/routes"
  env    = var.env

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  subnet_ids              = module.subnets.subnet_ids
  route_tables            = var.route_tables
  common_tags             = var.common_tags

  depends_on = [module.vnet, module.subnets]
}
