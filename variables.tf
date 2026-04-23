variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "mtc-resources"
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "Canada Central"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}
