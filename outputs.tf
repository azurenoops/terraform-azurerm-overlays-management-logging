# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

###############
# Outputs    ##
###############

output "laws_name" {
  description = "LAWS Name"
  value       = azurerm_log_analytics_workspace.loganalytics.name
}

output "laws_rgname" {
  description = "Resource Group for Laws"
  value       = local.resource_group_name
}

output "laws_resource_id" {
  description = "Resource ID for Laws"
  value       = azurerm_log_analytics_workspace.loganalytics.id
}

output "laws_storage_account_id" {
  description = "LAWS Storage Account ID"
  value       = module.loganalytics_sa.storage_account_id
}

output "laws_storage_account_name" {
  description = "LAWS Storage Account Name"
  value       = module.loganalytics_sa.storage_account_name
}

output "laws_storage_account_rgname" {
  description = "LAWS Storage Account Resource Group Name"
  value       = local.resource_group_name
}

output "laws_storage_account_location" {
  description = "LAWS Storage Account Location"
  value       = local.location
}
