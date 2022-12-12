resource "azurerm_servicebus_namespace" "example" {
  name                = "tfex-servicebus-namespace"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"

  //check
  identity {
    type         = var.identity.user
    identity_ids = var.identity_ids
  }

  capacity = var.capacity

  //check this set
  customer_managed_key {
    key_vault_key_id = ""
    identity         = ""
  }

  //check
  local_auth_enabled = var.local_auth_enabled
  //check
  public_network_access_enabled = var.public_network_access_enabled
  //check
  minimum_tls_version = var.minimum_tls_version
  zone_redundant      = var.zone_redundant
  tags                = var.tags
}

variable "identity" {
  type = map(any)
  default = {
    type         = ["SystemAssigned"]
    identity_ids = []
  }
}

variable "cmk" {
  type = map(any)
}