# Azure VMSS Extension Terraform module
Terraform module for creation Azure Virtual Machine Scale Set Extension

## Usage
```hcl
data "azurerm_virtual_machine_scale_set" "example" {
  name                = "example-name"
  resource_group_name = "example-rg"
}

locals {
  extensions_scale_sets = {
    name                         = "example-extention"
    virtual_machine_scale_set_id = data.azurerm_virtual_machine_scale_set.example.id
    settings = jsonencode({
      "script" : (base64encode(templatefile("./example.sh", {
         example-variable = "example-string-variable"
       })))
     })
   }
 }

module "virtual_machine_scale_set_extension" {
  source   = "data-platform-hq/vmss/azurerm"
  version  = "1.0.0"
  
  extensions = local.extensions_scale_sets
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                         | Version   |
| ---------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)    | >= 1.0.0  |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)          | >= 3.75.0 |

## Providers

| Name                                                                   | Version |
| ---------------------------------------------------------------------- | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)          | 3.75.0  |


## Inputs

| Name | Description | Type | Default                                                                                                                                               | Required |
|------|-------------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------|:--------:|
| <a name="input_extensions"></a> [extensions](#input\_extensions)| Objects to configure extentions for virtual machine |  <pre>object({<br>  name                 = string,<br>  virtual_machine_id   = string,<br>  publisher            = optional(string),<br>  type                 = optional(string),<br>  type_handler_version = optional(string),<br>  settings             = optional(string),<br>  protected_settings   = optional(string),<br>  tags                 = optional(map(any))<br>)}</pre> |  <pre>object({<br>  name                 = string,<br>  virtual_machine_id   = string,<br>  publisher            = optional(string, "Microsoft.Azure.Extensions"),<br>  type                 = optional(string, "CustomScript"),<br>  type_handler_version = optional(string, "2.0"),<br>  settings             = optional(string),<br>  protected_settings   = optional(string),<br>  tags                 = optional(map(any))<br>)}</pre>| no |

                                                                                                                                                                                                                
## Modules

No modules.

## Resources

| Name                                                                                                                                                                | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [azurerm_virtual_machine_scale_set_extension.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_scale_set_extension#protected_settings_from_key_vault)                           | resource |

## Outputs

| Name                                                                                                                          | Description                                          |
| ----------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Virtual Machine Scale Set Extension. |


<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-vmss-extension/blob/main/LICENSE)
