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
  description = "LAWS Resource Group Name"
  value       = local.resource_group_name
}

output "laws_resource_id" {
  description = "LAWS Resource ID"
  value       = azurerm_log_analytics_workspace.loganalytics.id
}

output "laws_workspace_id" {
  description = "LAWS Workspace ID"
  value       = azurerm_log_analytics_workspace.loganalytics.workspace_id
}

output "laws_storage_account_id" {
  description = "LAWS Storage Account ID"
  value       = module.mod_loganalytics_sa.storage_account_id
}

output "laws_storage_account_name" {
  description = "LAWS Storage Account Name"
  value       = module.mod_loganalytics_sa.storage_account_name
}

output "laws_storage_account_rgname" {
  description = "LAWS Storage Account Resource Group Name"
  value       = local.resource_group_name
}

output "laws_storage_account_location" {
  description = "LAWS Storage Account Location"
  value       = local.location
}

output "laws_private_link_scope_id" {
  description = "LAWS Private Link ID"
  value       = azurerm_monitor_private_link_scope.global_pls.id
}
