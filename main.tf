resource "azurerm_resource_group" "data_engineering_rg" {
  name     = var.resource_group_name
  location = var.location
}

module "azure_data_lake" {
  source = "./modules/azure_data_lake"

  resource_group_name = azurerm_resource_group.data_engineering_rg.name
  location            = azurerm_resource_group.data_engineering_rg.location
  role_assignments    = var.role_assignments
}

module "azure_data_factory" {
  source = "./modules/azure_data_factory"

  resource_group_name = azurerm_resource_group.data_engineering_rg.name
  location            = azurerm_resource_group.data_engineering_rg.location
  role_assignments    = var.role_assignments
}

module "azure_databricks" {
  source = "./modules/azure_databricks"

  resource_group_name = azurerm_resource_group.data_engineering_rg.name
  location            = azurerm_resource_group.data_engineering_rg.location
  role_assignments    = var.role_assignments
}

module "azure_service_bus" {
  source = "./modules/azure_service_bus"

  resource_group_name = azurerm_resource_group.data_engineering_rg.name
  location            = azurerm_resource_group.data_engineering_rg.location
  role_assignments    = var.role_assignments
}

module "azure_logic_apps" {
  source = "./modules/azure_logic_apps"

  resource_group_name = azurerm_resource_group.data_engineering_rg.name
  location            = azurerm_resource_group.data_engineering_rg.location
  role_assignments    = var.role_assignments
}

module "azure_log_analytics" {
  source = "./modules/azure_log_analytics"

  resource_group_name = azurerm_resource_group.data_engineering_rg.name
  location            = azurerm_resource_group.data_engineering_rg.location
  role_assignments    = var.role_assignments
}

module "azure_key_vault" {
  source = "./modules/azure_key_vault"

  resource_group_name = azurerm_resource_group.data_engineering_rg.name
  location            = azurerm_resource_group.data_engineering_rg.location
  role_assignments    = var.role_assignments
}

module "azure_cosmos_db" {
  source = "./modules/azure_cosmos_db"

  resource_group_name = azurerm_resource_group.data_engineering_rg.name
  location            = azurerm_resource_group.data_engineering_rg.location
  role_assignments    = var.role_assignments
}

output "resource_group_name" {
  value = azurerm_resource_group.data_engineering_rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.data_engineering_rg.location
}