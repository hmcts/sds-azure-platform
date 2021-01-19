project                    = "sdshmcts"
location                   = "uksouth"
env                        = "stg"
subscription               = "stg"
certificate_key_vault_name = "dtssharedservicesstgkv"
oms_env                    = "stg"
key_vault_resource_group   = "genesis-rg"
private_ip_address         = "10.142.32.132"
destinations               = ["10.142.15.250", "10.142.31.250"]
vnet_rg                    = "ss-stg-network-rg"
vnet_name                  = "ss-stg-vnet"
vault_name                 = ""
frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.staging.platform.hmcts.net"
    backend_domain   = ["firewall-stg-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-staging-platform-hmcts-net"
    disabled_rules   = {}
    product          = "ss"
  }
]