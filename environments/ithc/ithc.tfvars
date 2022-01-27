project            = "sdshmcts"
location           = "uksouth"
env                = "ithc"
subscription       = "ithc"
oms_env            = "ithc"
private_ip_address = "10.143.32.132"
destinations       = ["10.143.15.250", "10.143.31.250"]
vnet_rg            = "ss-ithc-network-rg"
vnet_name          = "ss-ithc-vnet"


frontends = [

  {
    name           = "toffee"
    custom_domain  = "toffee.ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-test-web"
    custom_domain  = "vh-test-web.demo.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsithc.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-video-web"
    custom_domain  = "vh-video-web.demo.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsithc.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-admin-web"
    custom_domain  = "vh-admin-web.demo.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsithc.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  }
]
