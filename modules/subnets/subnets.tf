/******************************************
	                Subnet
 *****************************************/
resource "azurerm_subnet" "subnet" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name

  address_prefixes                              = try(each.value.address_prefixes, [])
  service_endpoints                             = try(each.value.service_endpoints, [])
  private_endpoint_network_policies             = try(each.value.private_endpoint_network_policies, "Disabled")
  default_outbound_access_enabled               = try(each.value.default_outbound_access_enabled, true)
  private_link_service_network_policies_enabled = try(each.value.private_link_service_network_policies_enabled, true)

  dynamic "delegation" {
    for_each = each.value.delegation != null ? each.value.delegation : []

    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }
}
