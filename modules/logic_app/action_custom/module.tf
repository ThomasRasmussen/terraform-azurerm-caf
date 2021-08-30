resource "azurecaf_name" "laac" {
  name          = var.settings.name
  resource_type = "azurerm_logic_app_workflow"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}
resource "azurerm_logic_app_action_custom" "laac" {
  name         = azurecaf_name.laac.result
  logic_app_id = var.logic_app_id
  body         = var.settings.body
}
