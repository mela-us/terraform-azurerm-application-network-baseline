variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Redis Cache"
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "subnets" {
  type = list(
    object({
      name             = string
      address_prefixes = list(string)

      delegation = optional(
        list(
          object({
            name = string
            service_delegation = object({
              name    = string
              actions = list(string)
            })
          })
        )
      )

      default_outbound_access_enabled               = optional(bool, true)
      private_endpoint_network_policies             = optional(string, "Disabled")
      service_endpoints                             = optional(list(string), [])
      private_link_service_network_policies_enabled = optional(bool, true)
    })
  )

  description = "List of subnets to create in the virtual network"
}
