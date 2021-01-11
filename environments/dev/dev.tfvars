project                    = "sdshmcts"
location                   = "uksouth"
env                        = "dev"
subscription               = "dev"
oms_env                    = "dev"
private_ip_address         = ""
destinations               = []
vnet_rg                    = "ss-dev-network-rg"
vnet_name                  = "ss-dev-vnet"
key_vault_resource_group   = "genesis-rg"
certificate_key_vault_name = "dtssharedservicesdevkv"
vault_name                 = ""

frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.dev.platform.hmcts.net"
    backend_domain   = ["firewall-dev-int-palo-sdsdev.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-dev-platform-hmcts-net"
    disabled_rules   = {}
    product          = "ss"
  },
  {
    name             = "vh-user-api-dev"
    custom_domain    = "vh-user-api-dev.hearings.reform.hmcts.net"
    backend_domain   = ["firewall-dev-int-palo-sdsdev.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-hearings-reform-hmcts-net"
    disabled_rules   = {}
    product          = "vh"
  }
]
