# Network module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| routes | ./modules/routes | n/a |
| subnets | ./modules/subnets | n/a |
| vnet | ./modules/virtual-network | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| common\_tags | Common tags for all resources | `map(string)` | n/a | yes |
| env | Environment for the resources (e.g., dev, test, prod) | `string` | n/a | yes |
| resource\_group\_location | Location of the resource group | `string` | n/a | yes |
| resource\_group\_name | Name of the resource group | `string` | n/a | yes |
| route\_tables | List of route tables with their routes | <pre>list(object({<br/>    route_table_name = string<br/>    routes = list(object({<br/>      route_name             = string<br/>      address_prefix         = string<br/>      next_hop_type          = string<br/>      next_hop_in_ip_address = optional(string)<br/>    }))<br/>    subnet_names = list(string)<br/>  }))</pre> | n/a | yes |
| subnets | List of subnets to create in the virtual network | <pre>list(object({<br/>    name             = string<br/>    address_prefixes = list(string)<br/><br/>    delegation = optional(list(object({<br/>      name = string<br/>      service_delegation = object({<br/>        name    = string<br/>        actions = list(string)<br/>      })<br/>    })))<br/><br/>    default_outbound_access_enabled               = optional(bool, true)<br/>    private_endpoint_network_policies             = optional(string, "Disabled")<br/>    service_endpoints                             = optional(list(string), [])<br/>    private_link_service_network_policies_enabled = optional(bool, true)<br/>  }))</pre> | n/a | yes |
| vnet\_address\_space | Address space for the virtual network | `list(string)` | n/a | yes |
| vnet\_dns\_servers | List of DNS servers for the virtual network | `list(string)` | `[]` | no |
| vnet\_name | Name of the virtual network | `string` | n/a | yes |
<!-- END_TF_DOCS -->
