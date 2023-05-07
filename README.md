# Azure NoOps Operational Logging Terraform Module

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-template/azurerm/)

This module deploys a operations logging rg to an operations spoke network described in the [Microsoft recommended Hub-Spoke network topology](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/hub-spoke).

## SCCA Compliance

This module can be SCCA compliant and can be used in a SCCA compliant Network. Enable private endpoints and SCCA compliant network rules to make it SCCA compliant.

For more information, please read the [SCCA documentation]().

## Module Usage

```hcl
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_operational_logging" {
  source  = "azurenoops/overlays-management-logging"
  version = ">= 1.0.0"

  #####################################
  ## Global Settings Configuration  ###
  #####################################

  create_resource_group = true
  location              = "eastus"
  deploy_environment    = "dev"
  org_name              = "anoa"
  environment           = "public"
  workload_name         = "ops-core-logging"

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

  # By default, this will apply resource locks to all resources created by this module.
  # To disable resource locks, set the argument to `enable_resource_locks = false`.
  enable_resource_locks = false

  # Tags
  add_tags = {} # Tags to be applied to all resources
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurenoopsutils"></a> [azurenoopsutils](#requirement\_azurenoopsutils) | ~> 1.0.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.22 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurenoopsutils"></a> [azurenoopsutils](#provider\_azurenoopsutils) | ~> 1.0.4 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.22 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_loganalytics_sa"></a> [loganalytics\_sa](#module\_loganalytics\_sa) | azurenoops/overlays-storage-account/azurerm | >= 0.1.0 |
| <a name="module_mod_azregions"></a> [mod\_azregions](#module\_mod\_azregions) | azurenoops/overlays-azregions-lookup/azurerm | >= 1.0.0 |
| <a name="module_mod_scaffold_rg"></a> [mod\_scaffold\_rg](#module\_mod\_scaffold\_rg) | azurenoops/overlays-resource-group/azurerm | >= 1.0.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_solution.solutions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.loganalytics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_management_lock.laws_resource_group_level_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_management_lock.sa_resource_group_level_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [random_id.uniqueString](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [azurenoopsutils_resource_name.laws](https://registry.terraform.io/providers/azurenoops/azurenoopsutils/latest/docs/data-sources/resource_name) | data source |
| [azurenoopsutils_resource_name.logging_st](https://registry.terraform.io/providers/azurenoops/azurenoopsutils/latest/docs/data-sources/resource_name) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.rgrp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_tags"></a> [add\_tags](#input\_add\_tags) | Map of custom tags. | `map(string)` | `{}` | no |
| <a name="input_create_logging_resource_group"></a> [create\_logging\_resource\_group](#input\_create\_logging\_resource\_group) | Controls if the logging resource group should be created. If set to false, the resource group name must be provided. Default is true. | `bool` | `true` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Controls if the resource group should be created. If set to false, the resource group name must be provided. Default is false. | `bool` | `false` | no |
| <a name="input_custom_resource_group_name"></a> [custom\_resource\_group\_name](#input\_custom\_resource\_group\_name) | The name of the custom resource group to create. If not set, the name will be generated using the `org_name`, `workload_name`, `deploy_environment` and `environment` variables. | `string` | `null` | no |
| <a name="input_default_tags_enabled"></a> [default\_tags\_enabled](#input\_default\_tags\_enabled) | Option to enable or disable default tags. | `bool` | `true` | no |
| <a name="input_deploy_environment"></a> [deploy\_environment](#input\_deploy\_environment) | Name of the workload's environnement | `string` | n/a | yes |
| <a name="input_enable_azure_activity_log"></a> [enable\_azure\_activity\_log](#input\_enable\_azure\_activity\_log) | Controls if Azure Activity Log should be enabled. Default is true. | `bool` | `true` | no |
| <a name="input_enable_azure_security_center"></a> [enable\_azure\_security\_center](#input\_enable\_azure\_security\_center) | Controls if Azure Security Center should be enabled. Default is true. | `bool` | `true` | no |
| <a name="input_enable_container_insights"></a> [enable\_container\_insights](#input\_enable\_container\_insights) | Controls if Container Insights should be enabled. Default is true. | `bool` | `true` | no |
| <a name="input_enable_key_vault_analytics"></a> [enable\_key\_vault\_analytics](#input\_enable\_key\_vault\_analytics) | Controls if Key Vault Analytics should be enabled. Default is true. | `bool` | `true` | no |
| <a name="input_enable_monitoring_private_endpoints"></a> [enable\_monitoring\_private\_endpoints](#input\_enable\_monitoring\_private\_endpoints) | Enables private endpoints for monitoring resources. Default is true. | `bool` | `true` | no |
| <a name="input_enable_resource_locks"></a> [enable\_resource\_locks](#input\_enable\_resource\_locks) | (Optional) Enable resource locks, default is false. If true, resource locks will be created for the resource group and the storage account. | `bool` | `false` | no |
| <a name="input_enable_sentinel"></a> [enable\_sentinel](#input\_enable\_sentinel) | Controls if Sentinel should be enabled. Default is true. | `bool` | `true` | no |
| <a name="input_enable_service_map"></a> [enable\_service\_map](#input\_enable\_service\_map) | Controls if Service Map should be enabled. Default is true. | `bool` | `true` | no |
| <a name="input_enable_vm_insights"></a> [enable\_vm\_insights](#input\_enable\_vm\_insights) | Controls if VM Insights should be enabled. Default is true. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The Terraform backend environment e.g. public or usgovernment | `string` | n/a | yes |
| <a name="input_existing_resource_group_name"></a> [existing\_resource\_group\_name](#input\_existing\_resource\_group\_name) | The name of the existing resource group to use. If not set, the name will be generated using the `org_name`, `workload_name`, `deploy_environment` and `environment` variables. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region in which instance will be hosted | `string` | n/a | yes |
| <a name="input_lock_level"></a> [lock\_level](#input\_lock\_level) | (Optional) id locks are enabled, Specifies the Level to be used for this Lock. | `string` | `"CanNotDelete"` | no |
| <a name="input_log_analytics_logs_retention_in_days"></a> [log\_analytics\_logs\_retention\_in\_days](#input\_log\_analytics\_logs\_retention\_in\_days) | The number of days to retain logs for. Possible values are between 30 and 730. Default is 30. | `number` | `null` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | The SKU of the Log Analytics Workspace. Possible values are PerGB2018 and Free. Default is PerGB2018. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Optional prefix for the generated name | `string` | `""` | no |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | Optional suffix for the generated name | `string` | `""` | no |
| <a name="input_ops_logging_law_custom_name"></a> [ops\_logging\_law\_custom\_name](#input\_ops\_logging\_law\_custom\_name) | The name of the custom operational logging laws workspace to create. If not set, the name will be generated using the 'name\_prefix' and 'name\_suffix' variables. If set, the 'name\_prefix' and 'name\_suffix' variables will be ignored. | `string` | `null` | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Name of the organization | `string` | n/a | yes |
| <a name="input_use_location_short_name"></a> [use\_location\_short\_name](#input\_use\_location\_short\_name) | Use short location name for resources naming (ie eastus -> eus). Default is true. If set to false, the full cli location name will be used. if custom naming is set, this variable will be ignored. | `bool` | `true` | no |
| <a name="input_use_naming"></a> [use\_naming](#input\_use\_naming) | Use the Azure NoOps naming provider to generate default resource name. `storage_account_custom_name` override this if set. Legacy default name is used if this is set to `false`. | `bool` | `true` | no |
| <a name="input_workload_name"></a> [workload\_name](#input\_workload\_name) | Name of the workload\_name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_laws_name"></a> [laws\_name](#output\_laws\_name) | LAWS Name |
| <a name="output_laws_resource_id"></a> [laws\_resource\_id](#output\_laws\_resource\_id) | Resource ID for Laws |
| <a name="output_laws_rgname"></a> [laws\_rgname](#output\_laws\_rgname) | Resource Group for Laws |
| <a name="output_laws_storage_account_id"></a> [laws\_storage\_account\_id](#output\_laws\_storage\_account\_id) | LAWS Storage Account ID |
| <a name="output_laws_storage_account_location"></a> [laws\_storage\_account\_location](#output\_laws\_storage\_account\_location) | LAWS Storage Account Location |
| <a name="output_laws_storage_account_name"></a> [laws\_storage\_account\_name](#output\_laws\_storage\_account\_name) | LAWS Storage Account Name |
| <a name="output_laws_storage_account_rgname"></a> [laws\_storage\_account\_rgname](#output\_laws\_storage\_account\_rgname) | LAWS Storage Account Resource Group Name |
<!-- END_TF_DOCS -->