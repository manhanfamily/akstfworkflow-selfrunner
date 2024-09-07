terraform {
  backend "azurerm" {
      resource_group_name  = "akstfcli"
      storage_account_name = "nkstoragestate"
      container_name       = "staging"
      key                  = "staging.tfstate"
      }
}
