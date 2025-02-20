// outputs.tf for Azure Service Bus module

output "service_bus_namespace_id" {
  description = "The ID of the Azure Service Bus namespace."
  value       = azurerm_servicebus_namespace.example.id
}

output "service_bus_namespace_name" {
  description = "The name of the Azure Service Bus namespace."
  value       = azurerm_servicebus_namespace.example.name
}

output "service_bus_queue_id" {
  description = "The ID of the Azure Service Bus queue."
  value       = azurerm_servicebus_queue.example.id
}

output "service_bus_queue_name" {
  description = "The name of the Azure Service Bus queue."
  value       = azurerm_servicebus_queue.example.name
}

output "service_bus_topic_id" {
  description = "The ID of the Azure Service Bus topic."
  value       = azurerm_servicebus_topic.example.id
}

output "service_bus_topic_name" {
  description = "The name of the Azure Service Bus topic."
  value       = azurerm_servicebus_topic.example.name
}