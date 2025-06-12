# Network module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_routes"></a> [routes](#module\_routes) | ./modules/routes | n/a |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | ./modules/subnets | n/a |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ./modules/virtual-network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags for all resources | `map(string)` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment for the resources (e.g., dev, test, prod) | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_route_tables"></a> [route\_tables](#input\_route\_tables) | List of route tables with their routes | <pre>list(object({<br/>    route_table_name = string<br/>    routes = list(object({<br/>      route_name             = string<br/>      address_prefix         = string<br/>      next_hop_type          = string<br/>      next_hop_in_ip_address = optional(string)<br/>    }))<br/>    subnet_names = list(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnets to create in the virtual network | <pre>list(<br/>    object({<br/>      name             = string<br/>      address_prefixes = list(string)<br/><br/>      delegation = list(object({<br/>        name = string<br/>        service_delegation = object({<br/>          name    = string<br/>          actions = list(string)<br/>        })<br/>      }))<br/><br/>      default_outbound_access_enabled               = optional(bool, true)<br/>      private_endpoint_network_policies             = optional(string, "Disabled")<br/>      service_endpoints                             = optional(list(string), [])<br/>      private_link_service_network_policies_enabled = optional(bool, true)<br/>    })<br/>  )</pre> | n/a | yes |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | Address space for the virtual network | `list(string)` | n/a | yes |
| <a name="input_vnet_dns_servers"></a> [vnet\_dns\_servers](#input\_vnet\_dns\_servers) | List of DNS servers for the virtual network | `list(string)` | `[]` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the virtual network | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
