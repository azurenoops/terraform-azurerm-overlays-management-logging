# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#---------------------------------------------------------
# Hub Logging Storage Account Creation
#----------------------------------------------------------
module "loganalytics_sa" {
  source                       = "azurenoops/overlays-storage-account/azurerm"
  version                      = ">= 0.1.0"
  depends_on                   = [module.mod_scaffold_rg]
  existing_resource_group_name = local.resource_group_name
  org_name                     = var.org_name
  location                     = local.location
  environment                  = var.environment
  deploy_environment           = var.deploy_environment
  workload_name                = "${var.workload_name}${random_id.uniqueString.hex}"
  # Storage Account
  account_kind             = var.loganalytics_storage_account_kind
  account_tier             = var.loganalytics_storage_account_tier
  account_replication_type = var.loganalytics_storage_account_replication_type
  # Locks
  enable_resource_locks = var.enable_resource_locks
  add_tags              = merge(local.default_tags, var.add_tags, )
}
