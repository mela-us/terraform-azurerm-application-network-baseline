# Virtual network

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
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_space | The address space that is used by the virtual network | `list(string)` | n/a | yes |
| common\_tags | Common tags for all resources | `map(string)` | n/a | yes |
| env | env | `string` | n/a | yes |
| resource\_group\_location | The location of the resource group | `string` | n/a | yes |
| resource\_group\_name | The name of the resource group | `string` | n/a | yes |
| vnet\_dns\_servers | The DNS servers that are used by the virtual network | `list(string)` | `[]` | no |
| vnet\_name | The name of the virtual network | `string` | n/a | yes |
<!-- END_TF_DOCS -->
