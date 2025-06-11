# Subnets

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=4.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Redis Cache | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnets to create in the virtual network | <pre>list(<br/>    object({<br/>      name             = string<br/>      address_prefixes = list(string)<br/><br/>      # Optional properties for the subnet<br/>      delegation = optional(<br/>        list(<br/>          object({<br/>            name = string<br/>            service_delegation = object({<br/>              name    = string<br/>              actions = list(string)<br/>            })<br/>          })<br/>        )<br/>      )<br/>      default_outbound_access_enabled               = optional(bool, true)<br/>      private_endpoint_network_policies             = optional(string, "Disabled")<br/>      service_endpoints                             = optional(list(string), [])<br/>      private_link_service_network_policies_enabled = optional(bool, true)<br/>    })<br/>  )</pre> | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the virtual network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | Map of subnet names to their IDs |
<!-- END_TF_DOCS -->
