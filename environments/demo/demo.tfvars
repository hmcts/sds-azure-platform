project            = "sdshmcts"
location           = "uksouth"
env                = "demo"
subscription       = "demo"
oms_env            = "demo"
private_ip_address = "10.51.96.132"
destinations       = ["10.51.79.250"]
vnet_rg            = "ss-demo-network-rg"
vnet_name          = "ss-demo-vnet"

frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.demo.platform.hmcts.net"
    backend_domain   = ["firewall-demo-int-palo-sdsdemo.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    disabled_rules   = {}
    product          = "ss"
  },
  {
    name           = "pip-frontend"
    custom_domain  = "pip-frontend.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  }
]
