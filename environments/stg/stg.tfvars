project                    = "sdshmcts"
location                   = "uksouth"
env                        = "stg"
subscription               = "stg"
oms_env                    = "stg"
private_ip_address         = "10.142.32.132"
be_private_ip_address      = ["10.142.32.138"]
destinations               = ["10.142.15.250", "10.142.31.250"]
vnet_rg                    = "ss-stg-network-rg"
vnet_name                  = "ss-stg-vnet"
key_vault_resource_group   = "genesis-rg"
certificate_key_vault_name = "dtssharedservicesstgkv"
vault_name                 = "dtssharedservicesstgkv"

frontends = [

  {
    name           = "toffee"
    custom_domain  = "toffee.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
    product        = "ss"
  }
]