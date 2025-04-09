provider "azurerm" {
  features {}
  subscription_id = "cf13ac48-763a-4dd6-b402-af89cef1a1ed"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "buddy-wise"
    storage_account_name = "saakstfstateprod"
    container_name       = "tfstate-prod"
    key                  = "terraform.tfstate"
  }
}
