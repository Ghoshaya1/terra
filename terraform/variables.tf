variable "location" {
  description = "The region in which resources will be deployed."
}

variable "lifecycle_type" {
  description = "The type of environment, Dev/Prod"
  validation {
    condition     = contains(["Dev", "Prod"], var.lifecycle_type)
    error_message = "The lifecycle_type must be either 'Dev' or 'Prod'."
  }
}

variable "target_tenant_id" {
}

variable "target_subscription_id" {
}
