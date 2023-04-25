output "resource_group_name" {
  value = azurerm_resource_group.example.name
  description = "Name of the RG we deploy"
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name
  description = "Name of the ST"
}


output "storage_account_name_test" {
  value = azurerm_storage_account.example.name
  description = "Name of the ST"
}
