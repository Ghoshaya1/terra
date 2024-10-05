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

variable "virtual_network" {
  description = "Name of the virtual network"
  type        = string
}

variable "subnet" {
  description = "Name of the subnet"
  type        = string
}
