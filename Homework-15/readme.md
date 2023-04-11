# Terraform 

---


# Notes



Sorry for the crappy pdf but conversion from markdown to pdf sucks

---


## 1. Installing terraform

![proof](imgs/terra-01.png)

**side note**
I had issue with exporting the values following [Terraform azure example](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build), but having the variables seperately rather than hardcoded is better.

```terraform
provider "azurerm" {

  
  client_id       = "8e127a0c-c23a-4ff0-9fd7-13e248d82b39"
  client_secret   = var.az_secret
  tenant_id       = "91949ffb-068b-4c9e-96af-28114a5113a4"
  subscription_id = "0da916b7-0592-453c-a0a2-277eb2a9ab89
```
ToDo:
- [ ] Move everything to a .tfvar

## 2. Defining first terraform infrastrucute code

- Setting Azurerm

```terraform
terraform {
  required_providers {
    azurrm = {
      source = "hashicorp/azurerm"
      version = "3.35.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}
```


- Initializing
```bash
terraform init

Terraform has been successfully initialized!
```

- Planning:
  Getting an error because we don't have enough features. [Features](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block) is actually a block that gives extra configurations
```bash
terraform plan

╷
│ Error: Insufficient features blocks
│ 
│   on main.tf line 12, in provider "azurerm":
│   12: provider "azurerm" {
│ 
│ At least 1 "features" blocks are required.
╵

```

- After adding the missing block and reruing terraform plan.
```bash
terraform plan

No changes. Your infrastructure matches the configuration.
```

---

- Changing to older version
```go
version = "3.35.0"
```

- Adding the example code block
```go
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
```

- Executing plan: because of the version change we get some inconsistency.
```bash
terrafom plan

│ Error: Inconsistent dependency lock file
```