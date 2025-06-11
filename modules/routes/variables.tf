variable "env" {
  type        = string
  description = "env"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Redis Cache"
}

variable "resource_group_location" {
  type        = string
  description = "The location of the resource group in which to create the Redis Cache"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags for all resources"
}

variable "route_tables" {
  type = list(object({
    route_table_name = string
    routes = list(object({
      route_name             = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = optional(string)
    }))
    subnet_names = list(string)
  }))
  description = "List of route tables with their routes"
}

variable "subnet_ids" {
  description = "Map of subnet name to subnet ID"
  type        = map(string)
}
