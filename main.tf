resource "random_string" "name_suffix" {
  length           = 4  
  special          = false
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.region
}

resource "azurerm_app_service_plan" "asp" {
  name                = local.asp_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = var.asp_tier
    size = var.asp_size
  }
}

resource "azurerm_app_service" "webapp" {
  name                = local.web_app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    java_version = "11"
    java_container = "TOMCAT"
    java_container_version = "9.0"
  }

}
