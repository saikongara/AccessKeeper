resource "azurerm_cosmosdb_account" "example" {
  name                = var.cosmos_db_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = var.kind

  consistency_policy {
    consistency_level       = "Session"
    max_staleness_prefix    = 100
    max_interval_in_seconds = 5
  }

  capabilities {
    name = "EnableServerless"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "example" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.example.name
  throughput          = var.throughput
}

resource "azurerm_role_assignment" "cosmos_db_role_assignment" {
  for_each = var.role_assignments

  principal_id        = data.azuread_group[each.key].object_id
  role_definition_name = each.value
  scope               = azurerm_cosmosdb_account.example.id
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