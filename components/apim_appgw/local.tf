locals {
  env = var.env == "ithc" || var.env == "perftest" ? "nonprod" : var.env

  vnet_rg     = var.env == "ithc" || var.env == "perftest" ? "hmcts-hub-nonprod-int" : "ss-${var.env}-network-rg"
  vnet_name   = var.env == "ithc" || var.env == "perftest" ? "hmcts-hub-nonprodi" : "ss-${var.env}-vnet"
  subnet_name = "hub-appgw"

  key_vault_resource_group = "cft-platform-${var.subscription}-rg"
  key_vault_subscription   = var.key_vault_subscription

  gateways = yamldecode(data.local_file.configuration.content).gateways

  apim = {
    sbox = {
      dest_ip = "20.58.19.69/32"
    }
  }

  hub = {
    sbox = {
      subscription = "a8140a9e-f1b0-481f-a4de-09e2ee23f7ab"
      ukSouth = {
        name              = "hmcts-hub-sbox-int"
        next_hop_ip       = "10.10.200.36"
        appgw_next_hop_ip = "20.90.242.134" # Azure Firewall
      }
      ukWest = {
        name              = "ukw-hub-sbox-int"
        next_hop_ip       = "10.48.200.36"
        appgw_next_hop_ip = "51.11.114.133" # Azure Firewall
      }
    }
    nonprod = {
      subscription = "fb084706-583f-4c9a-bdab-949aac66ba5c"
      ukSouth = {
        name        = "hmcts-hub-nonprodi"
        next_hop_ip = "10.11.72.36"
      }
      ukWest = {
        name        = "ukw-hub-nonprodi"
        next_hop_ip = "10.49.72.36"
      }
    }
    prod = {
      subscription = "0978315c-75fe-4ada-9d11-1eb5e0e0b214"
      ukSouth = {
        name        = "hmcts-hub-prod-int"
        next_hop_ip = "10.11.8.36"
      }
      ukWest = {
        name        = "ukw-hub-prod-int"
        next_hop_ip = "10.49.8.36"
      }
    }
  }
}
