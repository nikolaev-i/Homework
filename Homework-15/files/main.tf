variable "az_secret" {}
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.36.0"
    }

  }
}

provider "azurerm" {

 features {} 

  client_id       = "4ab9b6b9-7c83-4ebc-b4ab-208cb278f73e"
  client_secret   = "~528Q~FJoaVS1dXDC9EypIfH9x4b2bQTc_wz4c5h"
  tenant_id       = "91949ffb-068b-4c9e-96af-28114a5113a4"
  subscription_id = "0da916b7-0592-453c-a0a2-277eb2a9ab89"
}


data "azurerm_subscription" "current" {}
 
resource "random_string" "random" {
  length  = 8
  special = false
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
  account_tier             = "Standard"
  account_replication_type = "GRS"
  blob_properties {
    restore_policy {
      days = 7
      
     
    }
    delete_retention_policy {
      days = 8
    }
    versioning_enabled = true
    change_feed_enabled = true
  }
  tags = {
    
    "enviorment" = "staging"
  }
}