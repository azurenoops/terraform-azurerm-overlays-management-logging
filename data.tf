# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# remove file if not needed
data "azurerm_client_config" "current" {}

data "azurerm_subnet" "pe_subnet" {
  name                 = var.private_endpoint_subnet_name
  virtual_network_name = var.private_endpoint_virtual_network_name
  resource_group_name  = var.private_endpoint_resource_group_name
}