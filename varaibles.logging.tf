# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

###########################
# Logging Configuration  ##
###########################

variable "create_logging_resource_group" {
  description = "Controls if the logging resource group should be created. If set to false, the resource group name must be provided. Default is true."
  type        = bool
  default     = true
}

variable "enable_monitoring_private_endpoints" {
  description = "Enables private endpoints for monitoring resources. Default is true."
  type        = bool
  default     = true
}

variable "log_analytics_workspace_sku" {
  description = "The SKU of the Log Analytics Workspace. Possible values are PerGB2018 and Free. Default is PerGB2018."
  type        = string
  default     = null
}

variable "log_analytics_logs_retention_in_days" {
  description = "The number of days to retain logs for. Possible values are between 30 and 730. Default is 30."
  type        = number
  default     = null
}

#####################################
# Log Solutions Configuration     ##
#####################################

variable "enable_sentinel" {
  description = "Controls if Sentinel should be enabled. Default is true."
  type        = bool
  default     = true
}

variable "enable_azure_activity_log" {
  description = "Controls if Azure Activity Log should be enabled. Default is true."
  type        = bool
  default     = true
}

variable "enable_vm_insights" {
  description = "Controls if VM Insights should be enabled. Default is true."
  type        = bool
  default     = true
}

variable "enable_azure_security_center" {
  description = "Controls if Azure Security Center should be enabled. Default is true."
  type        = bool
  default     = true
}

variable "enable_service_map" {
  description = "Controls if Service Map should be enabled. Default is true."
  type        = bool
  default     = true
}

variable "enable_container_insights" {
  description = "Controls if Container Insights should be enabled. Default is true."
  type        = bool
  default     = true
}

variable "enable_key_vault_analytics" {
  description = "Controls if Key Vault Analytics should be enabled. Default is true."
  type        = bool
  default     = true
}