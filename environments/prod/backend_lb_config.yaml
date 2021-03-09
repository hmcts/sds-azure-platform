project                    = "sdshmcts"
location                   = "uksouth"
env                        = "dev"
subscription               = "dev"
oms_env                    = "dev"
private_ip_address         = "10.145.32.132"
be_private_ip_address      = ["10.145.32.134"]
destinations               = ["10.145.15.250"]
vnet_rg                    = "ss-dev-network-rg"
vnet_name                  = "ss-dev-vnet"
key_vault_resource_group   = "genesis-rg"
certificate_key_vault_name = "dtssharedservicesdevkv"
vault_name                 = "dtssharedservicesdevkv"

frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.dev.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-dev-platform-hmcts-net"
    disabled_rules   = {}
    product          = "ss"
  }
]
