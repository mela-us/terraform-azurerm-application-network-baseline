# Routes

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.5 |
| azurerm | >=4.20.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >=4.20.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_route.route](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route_table.route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_subnet_route_table_association.subnet_route_table_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| common\_tags | Common tags for all resources | `map(string)` | n/a | yes |
| env | env | `string` | n/a | yes |
| resource\_group\_location | The location of the resource group in which to create the Redis Cache | `string` | n/a | yes |
| resource\_group\_name | The name of the resource group in which to create the Redis Cache | `string` | n/a | yes |
| route\_tables | List of route tables with their routes | <pre>list(object({<br/>    route_table_name = string<br/>    routes = list(object({<br/>      route_name             = string<br/>      address_prefix         = string<br/>      next_hop_type          = string<br/>      next_hop_in_ip_address = optional(string)<br/>    }))<br/>    subnet_names = list(string)<br/>  }))</pre> | n/a | yes |
| subnet\_ids | Map of subnet name to subnet ID | `map(string)` | n/a | yes |
<!-- END_TF_DOCS -->
