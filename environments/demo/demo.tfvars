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
    backend_domain = ["firewall-prod-int-palo-sdsdemo.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-test-web"
    custom_domain  = "vh-test-web.demo.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsdemo.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-video-web"
    custom_domain  = "vh-video-web.demo.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsdemo.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-admin-web"
    custom_domain  = "vh-admin-web.demo.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsdemo.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-service-web"
    custom_domain  = "vh-service-web.demo.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsdemo.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  }
]
