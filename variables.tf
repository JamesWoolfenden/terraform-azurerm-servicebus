variable "tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "capacity" {
  type    = number
  default = 0
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "minimum_tls_version" {
  type    = string
  default = "1.2"
}

variable "local_auth_enabled" {
  type    = bool
  default = false
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}
variable "zone_redundant" {
  type    = bool
  default = false
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
