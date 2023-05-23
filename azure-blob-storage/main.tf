resource "azurerm_resource_group" "resource_group" {
  name     = "resource-group"
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "examplestorageaccount"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = var.tier
  account_replication_type = var.type

  tags = {
    environment = var.env
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "examplecontainer"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = var.access_type
}

resource "azurerm_storage_blob" "storage_blob" {
  name                   = "exampleblob"
  storage_account_name  = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = var.blob_type
}