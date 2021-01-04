project                    = "sdshmcts"
location                   = "uksouth"
env                        = "stg"
subscription               = "stg"
certificate_key_vault_name = "dtssharedservicesstgkv"
data_subscription          = "74dacd4f-a248-45bb-a2f0-af700dc4cf68"
oms_env                    = "stg"
key_vault_resource_group   = "genesis-rg"
subscription_id            = "74dacd4f-a248-45bb-a2f0-af700dc4cf68"
frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.staging.platform.hmcts.net"
    backend_domain   = ["firewall-stg-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-staging-platform-hmcts-net"
    disabled_rules   = {}
  }
]