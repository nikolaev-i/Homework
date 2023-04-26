/*----------------------------------------------------------*/

locals {
  base_name         = "${var.my_name}-${var.enviorment}"
  network_base_name = "${local.base_name}-net"
}

/*----------------------------------------------------------*/
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {}
}


provider "azurerm" {

  features {}

  client_id       = var.id
  client_secret   = var.secret
  tenant_id       = var.t_id
  subscription_id = var.subscription
}

data "azurerm_subscription" "current" {}

/*----------------------------------------------------------*/

resource "azurerm_resource_group" "general_network" {
  name     = "${local.network_base_name}-rg"
  location = var.location
}


resource "azurerm_virtual_network" "general_network" {
  name                = "${local.network_base_name}-vnet"
  location            = azurerm_resource_group.general_network.location
  resource_group_name = azurerm_resource_group.general_network.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "general_network_vms" {
  name                 = "${azurerm_virtual_network.general_network.name}-vms-snet"
  resource_group_name  = azurerm_resource_group.general_network.name
  virtual_network_name = azurerm_virtual_network.general_network.name
  address_prefixes     = ["10.0.1.0/24"]
}


