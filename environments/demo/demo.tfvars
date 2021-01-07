project                    = "sdshmcts"
location                   = "uksouth"
env                        = "demo"
subscription               = "demo"
oms_env                    = "demo"
private_ip_address         = ""
destinations               = []
vnet_rg                    = "ss-demo-network-rg"
vnet_name                  = "ss-demo-vnet"
key_vault_resource_group   = "genesis-rg"
certificate_key_vault_name = "dtssharedservicesdemokv"
vault_name                 = ""
frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.demo.platform.hmcts.net"
    backend_domain   = ["firewall-demo-int-palo-sdsdemo.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    disabled_rules   = {}
    product          = "ss"
  }
]
data_subscription = "867a878b-cb68-4de5-9741-361ac9e178b6"