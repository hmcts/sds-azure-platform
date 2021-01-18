project                    = "sdshmcts"
location                   = "uksouth"
env                        = "demo"
subscription               = "demo"
oms_env                    = "demo"
private_ip_address         = "10.51.96.132"
destinations               = ["10.51.79.250"]
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
