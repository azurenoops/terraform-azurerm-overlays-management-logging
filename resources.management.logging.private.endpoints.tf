# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_private_endpoint" "subnet_private_endpoint" {
  depends_on = [
    azurerm_monitor_private_link_scoped_service.laws_pls    
  ]
  name     = local.privateLinkEndpointName
  location = local.location

  resource_group_name = local.resource_group_name

  subnet_id = data.azurerm_subnet.pe_subnet.id

  private_service_connection {
    name                           = local.privateLinkConnectionName
    is_manual_connection           = false
    private_connection_resource_id = azurerm_monitor_private_link_scope.global_pls.id
    subresource_names              = ["azuremonitor"]
  }

  tags = merge(local.default_tags, var.add_tags)
}
