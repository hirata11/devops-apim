terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"

    }

  }
    backend "azurerm" {
        resource_group_name  = "tfstate"
        storage_account_name = "saterraformstatestgncus"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
}
provider "azurerm" {
  features { }
  subscription_id = "cddd960b-cdff-4460-99cd-390f7cec01a5"
}

resource "azurerm_resource_group" "apim" {
  name     = "rg-apim-stg-ncus"
  location = "northcentralus"
}

resource "azurerm_api_management" "apim" {
  name                = "api-stg-ncus"
  location            = azurerm_resource_group.apim.location
  resource_group_name = azurerm_resource_group.apim.name
  publisher_name      = "Vibe Saude"
  publisher_email     = "fernando.hirata@vibesaude.com"

  sku_name = "Developer_1"
}
