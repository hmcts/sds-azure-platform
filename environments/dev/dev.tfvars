project                    = "sdshmcts"
location                   = "uksouth"
env                        = "dev"
subscription               = "dev"
oms_env                    = "dev"
private_ip_address         = "10.140.32.132"
destinations               = []
vnet_rg                    = "ss-dev-network-rg"
vnet_name                  = "ss-dev-vnet"
key_vault_resource_group   = "genesis-rg"
certificate_key_vault_name = "dtssharedservicesdevkv"
frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.dev.platform.hmcts.net"
    backend_domain   = ["firewall-dev-int-palo-sdsdev.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-dev-platform-hmcts-net"
    disabled_rules   = {}
  }
]
data_subscription = "867a878b-cb68-4de5-9741-361ac9e178b6"