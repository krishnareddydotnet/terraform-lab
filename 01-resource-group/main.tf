terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>5.10"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraformlab-tfstate-cin-001"
    storage_account_name = "sttflabstatecin001"
    container_name       = "tfstate"
    key                  = "01-resource-group.tfstate"
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {} 
}

resource "azurerm_resource_group" "main" {
  name     = "rg-terraform"
  location = "centralindia"
}

