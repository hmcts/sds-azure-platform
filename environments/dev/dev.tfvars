project                    = "sdshmcts"
location                   = "uksouth"
env                        = "dev"
subscription               = "dev"
certificate_key_vault_name = "dtssharedservicesdevkv"
data_subscription          = "867a878b-cb68-4de5-9741-361ac9e178b6"
oms_env                    = "dev"
key_vault_resource_group   = "genesis-rg"
subscription_id            = "867a878b-cb68-4de5-9741-361ac9e178b6"
frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.dev.platform.hmcts.net"
    backend_domain   = ["firewall-dev-int-palo-sdsdev.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-dev-platform-hmcts-net"
    disabled_rules   = {}
  }
]
