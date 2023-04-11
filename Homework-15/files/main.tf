variable "az_secret" {}
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.51.0"
    }

  }
}

provider "azurerm" {

  

  client_id       = "8e127a0c-c23a-4ff0-9fd7-13e248d82b39"
  client_secret   = var.az_secret
  tenant_id       = "91949ffb-068b-4c9e-96af-28114a5113a4"
  subscription_id = "0da916b7-0592-453c-a0a2-277eb2a9ab89"
}


data "azurerm_subscription" "current" {}




resource "random_string" "random" {
  length  = 8
  special = 8
  lower   = true
  upper   = false
}

resource "azurerm_resource_group" "example" {
  name     = "${random_string.random.result}sa"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     =  "${random_string.random.result}sa"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  access_tier              = "Standard"
  account_replication_type = "GRS"
  blob_properties {
    restore_policy {
      days = 7
    }
  }
  tags = {
    "enviorment" = "staging"
  }
}