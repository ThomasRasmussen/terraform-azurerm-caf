locals {
  keyvault_id = local.create_sshkeys ? try(var.keyvaults[var.settings.lz_key][var.settings.keyvault_key].id, var.keyvaults[var.client_config.landingzone_key][var.settings.keyvault_key].id) : null
}
