/******************************************
	              Route Table
 *****************************************/
resource "azurerm_route_table" "route_table" {
  for_each = { for rt in var.route_tables : rt.route_table_name => rt }

  name                = each.value.route_table_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  tags = merge(
    var.common_tags,
    {
      environment = var.env
    }
  )
}

/******************************************
	                Route
 *****************************************/
resource "azurerm_route" "route" {
  for_each = {
    for route in local.routes : "${route.route_table_name}-${route.route_name}" => route
  }

  name                = each.value.route_name
  resource_group_name = var.resource_group_name
  route_table_name    = each.value.route_table_name
  address_prefix      = each.value.address_prefix
  next_hop_type       = each.value.next_hop_type

  depends_on = [ azurerm_route_table.route_table[each.value.route_table_name] ]
}

locals {
  routes = flatten([
    for rt in var.route_tables : [
      for route in rt.routes : {
        route_name       = route.route_name
        address_prefix   = route.address_prefix
        next_hop_type    = route.next_hop_type
        route_table_name = rt.route_table_name
      }
    ]
  ])
}


/******************************************
	        Route Table Association
 *****************************************/
resource "azurerm_subnet_route_table_association" "subnet_route_table_association" {
  for_each = {
    for assoc in local.route_table_associations :
    "${assoc.route_table_name}-${assoc.subnet_name}" => assoc
  }

  subnet_id      = var.subnet_ids[each.value.subnet_name]
  route_table_id = azurerm_route_table.route_table[each.value.route_table_name].id

  depends_on = [ azurerm_route_table.route_table[each.value.route_table_name] ]
}

locals {
  route_table_associations = flatten([
    for rt in var.route_tables : [
      for subnet_name in rt.subnet_names : {
        route_table_name = rt.route_table_name
        subnet_name      = subnet_name
      }
    ]
  ])
}
