/******************************************
	            Virtual Network
 *****************************************/
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.vnet_dns_servers

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}