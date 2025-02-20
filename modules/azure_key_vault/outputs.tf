output "key_vault_id" {
  description = "The ID of the Azure Key Vault."
  value       = azurerm_key_vault.example.id
}

output "key_vault_uri" {
  description = "The URI of the Azure Key Vault."
  value       = azurerm_key_vault.example.vault_uri
}

output "key_vault_name" {
  description = "The name of the Azure Key Vault."
  value       = azurerm_key_vault.example.name
}