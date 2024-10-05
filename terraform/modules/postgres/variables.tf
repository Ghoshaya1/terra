variable "short_resource_name_prefix" {
  description = "The prefix for the short resource name."
}

variable "tags" {
  description = "The tags for the resource."
  type        = map(string)
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location of the resource."
  type        = string
}

variable "delegated_subnet_id" {
  description = "The ID of the delegated subnet."
  type        = string
}

variable "vnet_id" {
  description = "The ID of the virtual network."
  type        = string
}

variable "admin_login" {
  description = "The admin login for the PostgreSQL server."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the PostgreSQL server."
  type        = string
}
