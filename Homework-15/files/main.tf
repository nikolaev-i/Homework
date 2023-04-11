terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.51.0"
    }

  }
}

provider "azurerm" {
  features {}

  client_id       = "8e127a0c-c23a-4ff0-9fd7-13e248d82b39"
  client_secret   = "qVj8Q~2Kf5NvMAufFU9erGxM8BFQ858cxYdm_dew"
  tenant_id       = "91949ffb-068b-4c9e-96af-28114a5113a4"
  subscription_id = "0da916b7-0592-453c-a0a2-277eb2a9ab89"
}


data "azurerm_subscription" "current" {}
output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}


