locals {
  rg_name         = format("%s-%s-rg", var.app_name, random_string.name_suffix.result)
  asp_name        = format("%s-%s-asp", var.app_name, random_string.name_suffix.result)
  web_app_name    = format("%s-%s-wapp", var.app_name, random_string.name_suffix.result)

}