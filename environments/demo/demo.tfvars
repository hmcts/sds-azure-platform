project                    = "sdshmcts"
location                   = "uksouth"
env                        = "demo"
subscription               = "demo"
certificate_key_vault_name = "dtssharedservicesdemokv"
data_subscription          = "867a878b-cb68-4de5-9741-361ac9e178b6"
oms_env                    = "demo"
key_vault_resource_group   = "genesis-rg"
subscription_id            = "867a878b-cb68-4de5-9741-361ac9e178b6"
frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.demo.platform.hmcts.net"
    backend_domain   = ["firewall-demo-int-palo-sdsdemo.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    disabled_rules   = {}
  }
]
