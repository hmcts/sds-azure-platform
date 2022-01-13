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
    name           = "pip-frontend"
    custom_domain  = "pip-frontend.demo.platform.hmcts.net"
    backend_domain = ["firewall-demo-int-palo-sdsdemo.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  }
]
