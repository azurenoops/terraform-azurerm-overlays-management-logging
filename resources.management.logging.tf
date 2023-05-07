
#---------------------------------------------------------
# Operations Log Analytics Workspace Creation
#----------------------------------------------------------
resource "azurerm_log_analytics_workspace" "loganalytics" {
  name                = local.ops_logging_law_name
  location            = local.location
  resource_group_name = local.resource_group_name
  sku                 = var.log_analytics_workspace_sku == null ? "PerGB2018" : var.log_analytics_workspace_sku
  retention_in_days   = var.log_analytics_logs_retention_in_days == null ? 30 : var.log_analytics_logs_retention_in_days
  tags                = merge({ "ResourceName" = format("%s", local.ops_logging_law_name) }, local.default_tags, var.add_tags, )
}

#---------------------------------------------------------
# Operations Log Analytics Workspace Solutions Creation
#----------------------------------------------------------
resource "azurerm_log_analytics_solution" "solutions" {
  for_each              = { for solution in local.log_analytics_solutions : solution.name => solution if solution.deploy }
  solution_name         = each.value.name
  location              = local.location
  resource_group_name   = local.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.loganalytics.id
  workspace_name        = azurerm_log_analytics_workspace.loganalytics.name

  plan {
    publisher = each.value.publisher
    product   = each.value.product
  }

  tags = merge({ "SolutionName" = format("%s", each.value.name) }, local.default_tags, var.add_tags, )

}
