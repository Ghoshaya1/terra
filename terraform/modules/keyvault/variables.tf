variable "short_resource_name_prefix" {
  description = ""
}

variable "tags" {
  description = ""
  type        = map(string)
}

variable "resource_group_name" {
  description = ""
  type        = string
}

variable "location" {
  description = ""
  type        = string
}

variable "target_tenant_id" {
  description = ""
  type        = string
}

variable "kv_name" {
  description = ""
  type        = string
}

variable "vnet_id" {
  description = ""
  type        = string
}
