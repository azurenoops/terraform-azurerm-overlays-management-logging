# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#---------------------------------
# Local declarations
#---------------------------------
resource "random_id" "uniqueString" {
  keepers = {
    # Generate a new id each time we change resourePrefix variable
    org_prefix = var.org_name
    subid      = var.workload_name
  }
  byte_length = 8
}

locals {
  # Path: src\terraform\azresources\modules\Microsoft.Security\azureSecurityCenter\main.tf
  # Name: azureSecurityCenter
  # Description: Azure Security Center

  log_analytics_solutions = [
    {
      deploy : var.enable_azure_activity_log
      name : "AzureActivity"
      product : "OMSGallery/AzureActivity"
      publisher : "Microsoft"
      promotionCode : ""
    },
    {
      deploy : var.enable_sentinel
      name : "SecurityInsights"
      product : "OMSGallery/SecurityInsights"
      publisher : "Microsoft"
      promotionCode : ""
    },
    {
      deploy : var.enable_vm_insights
      name : "VMInsights"
      product : "OMSGallery/VMInsights"
      publisher : "Microsoft"
      promotionCode : ""
    },
    {
      deploy : var.enable_azure_security_center
      name : "Security"
      product : "OMSGallery/Security"
      publisher : "Microsoft"
      promotionCode : ""
    },
    {
      deploy : var.enable_service_map
      name : "ServiceMap"
      publisher : "Microsoft"
      product : "OMSGallery/ServiceMap"
      promotionCode : ""
    },
    {
      deploy : var.enable_container_insights
      name : "ContainerInsights"
      publisher : "Microsoft"
      product : "OMSGallery/ContainerInsights"
      promotionCode : ""
    },
    {
      deploy : var.enable_key_vault_analytics
      name : "KeyVaultAnalytics"
      publisher : "Microsoft"
      product : "OMSGallery/KeyVaultAnalytics"
      promotionCode : ""
    }
  ]

  privateLinkConnectionName    = "plconn${azurerm_log_analytics_workspace.loganalytics.name}${random_id.uniqueString.hex}"
  privateLinkEndpointName      = "pl${azurerm_log_analytics_workspace.loganalytics.name}${random_id.uniqueString.hex}"
  privateLinkScopeName         = "plscope${azurerm_log_analytics_workspace.loganalytics.name}${random_id.uniqueString.hex}"
  privateLinkScopeResourceName = "plscres${azurerm_log_analytics_workspace.loganalytics.name}${random_id.uniqueString.hex}"
}
