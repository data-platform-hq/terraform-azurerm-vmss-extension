resource "azurerm_virtual_machine_scale_set_extension" "this" {
  name                         = var.extensions.name
  virtual_machine_scale_set_id = var.extensions.virtual_machine_id
  publisher                    = var.extensions.publisher
  type                         = var.extensions.type
  type_handler_version         = var.extensions.type_handler_version
  settings                     = var.extensions.settings
  protected_settings           = var.extensions.protected_settings
}