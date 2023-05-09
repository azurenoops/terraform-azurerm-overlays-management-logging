# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#---------------------------------------------------------
# Hub Logging Storage Account Creation
#----------------------------------------------------------
module "loganalytics_sa" {
  source              = "azurenoops/overlays-storage-account/azurerm"
  version             = ">= 0.1.0"
  depends_on          = [module.mod_scaffold_rg]
  resource_group_name = local.resource_group_name
  location            = local.location
  environment         = var.environment
  deploy_environment  = var.deploy_environment
  workload_name       = random_id.uniqueString.hex
  org_name            = var.org_name
  # Locks
  enable_resource_locks = var.enable_resource_locks
  add_tags              = merge(local.default_tags, var.add_tags, )
}
