project                    = "sdshmcts"
location                   = "uksouth"
env                        = "ithc"
subscription               = "ithc"
certificate_key_vault_name = "dtssharedservicesithckv"
data_subscription          = "ba71a911-e0d6-4776-a1a6-079af1df7139"
oms_env                    = "ithc"
key_vault_resource_group   = "genesis-rg"
subscription_id            = "ba71a911-e0d6-4776-a1a6-079af1df7139"
frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-ithc-int-palo-sdsithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    disabled_rules   = {}
  }
]
