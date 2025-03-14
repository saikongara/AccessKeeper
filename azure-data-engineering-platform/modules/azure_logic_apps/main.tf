resource "azurerm_logic_app_workflow" "example" {
  name                = var.logic_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  workflow_schema = "https://schema.management.azure.com/schemas/2016-06-01/workflowdefinition.json#"
}

resource "azurerm_role_assignment" "logic_app_role_assignment" {
  for_each = var.role_assignments

  principal_id        = data.azuread_group[each.key].object_id
  role_definition_name = each.value
  scope               = azurerm_logic_app_workflow.example.id
}

data "azuread_group" "Engineer_Onshore" {
  display_name = "Engineer_Onshore"
}

data "azuread_group" "Engineer_Offshore" {
  display_name = "Engineer_Offshore"
}

data "azuread_group" "Analyst_Onshore" {
  display_name = "Analyst_Onshore"
}

data "azuread_group" "Analyst_Offshore" {
  display_name = "Analyst_Offshore"
}

data "azuread_group" "Operations_Onshore" {
  display_name = "Operations_Onshore"
}

data "azuread_group" "Operations_Offshore" {
  display_name = "Operations_Offshore"
}