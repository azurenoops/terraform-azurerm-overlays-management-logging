# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_logging" {
  source = "../../.." # Path to the root of the repository

  depends_on = [azurerm_resource_group.example-network-rg, azurerm_virtual_network.example-vnet, azurerm_subnet.example-snet]

  #####################################
  ## Global Settings Configuration  ###
  #####################################

  create_resource_group = true
  location              = var.location
  deploy_environment    = var.deploy_environment
  org_name              = var.org_name
  environment           = var.environment
  workload_name         = var.workload_name

  #############################
  ## Logging Configuration  ###
  #############################

  # (Optional) Logging Solutions
  # All solutions are enabled (true) by default
  enable_sentinel           = true
  enable_azure_activity_log = true
  enable_vm_insights        = true

  # (Required) To enable Azure Monitoring
  # Sku Name - Possible values are PerGB2018 and Free
  # Log Retention in days - Possible values range between 30 and 730
  log_analytics_workspace_sku          = "PerGB2018"
  log_analytics_logs_retention_in_days = 30

  #############################
  ## Misc Configuration     ###
  #############################

  # Enable Azure Monitor Private Link Scope
  enable_ampls = true

  # AMPLS Configuration
  existing_network_resource_group_name = azurerm_resource_group.example-network-rg.name
  existing_virtual_network_name        = azurerm_virtual_network.example-vnet.name
  existing_private_subnet_name         = azurerm_subnet.example-snet.name

  # By default, this will apply resource locks to all resources created by this module.
  # To disable resource locks, set the argument to `enable_resource_locks = false`.
  enable_resource_locks = false

  # Tags
  add_tags = {} # Tags to be applied to all resources
}
