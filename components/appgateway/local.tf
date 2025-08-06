locals {
  hub_env                  = (var.env == "demo" || var.env == "dev" || var.env == "ithc" || var.env == "test") ? "nonprod" : (var.env == "aat" || var.env == "stg") ? "prod" : var.env
  key_vault_name           = "acmedtssds${var.subscription}"
  key_vault_resource_group = "sds-platform-${var.subscription}-rg"

  hub = {
    sbox = {
      subscription = "ea3a8c1e-af9d-4108-bc86-a7e2d267f49c"
    }
    nonprod = {
      subscription = "fb084706-583f-4c9a-bdab-949aac66ba5c"
    }
    prod = {
      subscription = "0978315c-75fe-4ada-9d11-1eb5e0e0b214"
    }
  }

  # To be removed once the TLS1.0/1.1 deprecation is complete
  current_ssl_policy = {
    policy_type = "Predefined"
    policy_name = "AppGwSslPolicy20150501"
  }
}
