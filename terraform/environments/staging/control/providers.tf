terraform {
  required_version = ">= 1.4.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 4.0.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "= 2.47.0"
    }
  }
  # backend "azurerm" {} #TODO: when runner + SA private enabled then change
}

provider "azurerm" {
  features {}
}
