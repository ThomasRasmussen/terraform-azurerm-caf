terraform {
  required_providers {
  }
  required_version = ">= 1.4.0"
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  alias = "vhub"
}

module "caf" {
  source = "git@github.com:ThomasRasmussen/terraform-azurerm-caf.git?ref=5.7.5"
  #source  = "aztfmod/caf/azurerm"
  #version = "5.7.0"

  providers = {
    azurerm.vhub = azurerm.vhub
  }
  
  global_settings = var.global_settings
  resource_groups = var.resource_groups
  keyvaults       = var.keyvaults

  compute = {
    #virtual_machines = var.virtual_machines
    aks_clusters = var.aks_clusters
  }

  networking = {
    public_ip_addresses = var.public_ip_addresses
    vnets               = var.vnets
  }
}


