resource "azurerm_servicebus_namespace" "example" {
  name                = "tfex-servicebus-namespace"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"

  //check
  identity {
    type         = var.identity.type
    identity_ids = var.identity.identity_ids
  }

  capacity = var.capacity

  //check this set
  dynamic "customer_managed_key" {
    for_each = var.cmk
    content {
      key_vault_key_id = customer_managed_key.value["key_vault_key_id"]
      identity_id      = customer_managed_key.value["identity_id"]
    }
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
  type = object({
    type         = string
    identity_ids = list(string)
  })
  default = {
    type         = "SystemAssigned"
    identity_ids = []
  }
}

variable "cmk" {
  type = list(object({
    key_vault_key_id = string
    identity_id      = string
  }))
}