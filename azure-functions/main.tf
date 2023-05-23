resource "azurerm_resource_group" "function_rg" {
  name     = "function-rg"
  location = var.location
}

resource "azurerm_linux_function_app" "function_app" {
  name                      = "function-app"
  location                  = azurerm_resource_group.function_rg.location
  resource_group_name       = azurerm_resource_group.function_rg.name
  storage_account_name      = azurerm_storage_account.function_storage.name
  storage_account_access_key = azurerm_storage_account.function_storage.primary_access_key
  site_config {
    always_on                 = true
  }
  service_plan_id = azurerm_app_service_plan.app_service_plan.id
}

resource "azurerm_app_service_plan" "function_plan" {
  name                = "function-plan"
  location            = azurerm_resource_group.function_rg.location
  resource_group_name = azurerm_resource_group.function_rg.name
  sku {
    tier = var.SKU_TIER
    size = var.SKU_SIZE
  }
}

resource "azurerm_storage_account" "function_storage" {
  name                     = "functionstorage"
  resource_group_name      = azurerm_resource_group.function_rg.name
  location                 = azurerm_resource_group.function_rg.location
  account_tier             = var.tier
  account_replication_type = var.type
}

resource "azurerm_function_app_function" "app_function" {
  name                      = "function"
  config_json     = ""
  function_app_id = azurerm_linux_function_app.function_app.id
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "app-service-plan"
  location            = var.location
  resource_group_name = azurerm_resource_group.function_rg.name

  sku {
    tier = var.SKU_TIER
    size = var.SKU_SIZE
  }
}