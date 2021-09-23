project               = "sdshmcts"
location              = "uksouth"
env                   = "stg"
subscription          = "stg"
oms_env               = "stg"
private_ip_address    = "10.148.32.132"
be_private_ip_address = ["10.148.32.138"]
destinations          = ["10.148.15.250", "10.148.31.250"]
vnet_rg               = "ss-stg-network-rg"
vnet_name             = "ss-stg-vnet"

frontends = [

  {
    name           = "toffee"
    custom_domain  = "toffee.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "pip-frontend"
    custom_domain  = "pip-frontend.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "pip-business-rules"
    custom_domain  = "pip-business-rules.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "hmi-case-hq-emulator"
    custom_domain  = "hmi-case-hq-emulator.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  }
]
