variable "env" {
  type        = string
  description = "Environment for the resources (e.g., dev, test, prod)"
}

variable "common_tags" {
  type        = any
  description = "Common tags for all resources"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the virtual network"
}

variable "vnet_dns_servers" {
  type        = list(string)
  default     = []
  description = "List of DNS servers for the virtual network"
}

variable "subnets" {
  type = list(
    object({
      name             = string
      address_prefixes = list(string)

      # Optional properties for the subnet
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

variable "route_tables" {
  type = list(object({
    route_table_name = string
    routes = list(object({
      route_name     = string
      address_prefix = string
      next_hop_type  = string
    }))
    subnet_names = list(string)
  }))
  description = "List of route tables with their routes"
}