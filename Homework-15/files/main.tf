terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.51.0"
    }

  }
}

provider "azurerm" {
  # Configuration options
  data "azurerm_subscription" "my_subscription" {
  subscription_id = "12345678-1234-1234-1234-1234567890ab"
}

output "my_subscription_display_name" {
  value = data.azurerm_subscription.my_subscription.display_name

 }
}


