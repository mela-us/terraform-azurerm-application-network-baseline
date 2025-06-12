# Subnets

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
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource\_group\_name | The name of the resource group in which to create the Redis Cache | `string` | n/a | yes |
| subnets | List of subnets to create in the virtual network | <pre>list(<br/>    object({<br/>      name             = string<br/>      address_prefixes = list(string)<br/><br/>      delegation = list(object({<br/>        name = string<br/>        service_delegation = object({<br/>          name    = string<br/>          actions = list(string)<br/>        })<br/>      }))<br/><br/>      default_outbound_access_enabled               = optional(bool, true)<br/>      private_endpoint_network_policies             = optional(string, "Disabled")<br/>      service_endpoints                             = optional(list(string), [])<br/>      private_link_service_network_policies_enabled = optional(bool, true)<br/>    })<br/>  )</pre> | n/a | yes |
| vnet\_name | The name of the virtual network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_ids | Map of subnet names to their IDs |
<!-- END_TF_DOCS -->
