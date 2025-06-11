variable "env" {
  type        = string
  description = "env"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "The location of the resource group"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags for all resources"
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network"
}

variable "dns_servers" {
  type        = list(string)
  default     = []
  description = "The DNS servers that are used by the virtual network"
}