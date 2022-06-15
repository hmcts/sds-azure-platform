project            = "sdshmcts"
location           = "uksouth"
env                = "ithc"
subscription       = "ithc"
oms_env            = "ithc"
private_ip_address = "10.143.32.132"
destinations       = ["10.143.15.250", "10.143.31.250"]
vnet_rg            = "ss-ithc-network-rg"
vnet_name          = "ss-ithc-vnet"
hub                = "nonprod"

frontends = [

  {
    name           = "toffee"
    custom_domain  = "toffee.ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    priority       = 10

    disabled_rules = {}
  },
  {
    name              = "pip-frontend"
    custom_domain     = "pip-frontend.platform.hmcts.net"
    backend_domain    = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    priority          = 20
    certificate_name  = "wildcard-platform-hmcts-net"
    shutter_app       = true
    disabled_rules    = {}
    global_exclusions = []
  },
  {
    name           = "vh-test-web"
    custom_domain  = "vh-test-web.ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    priority       = 30

    disabled_rules = {}
  },
  {
    name           = "vh-video-web"
    custom_domain  = "vh-video-web.ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    priority       = 40

    disabled_rules = {}
  },
  {
    name           = "vh-admin-web"
    custom_domain  = "vh-admin-web.ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    priority       = 50

    disabled_rules = {}
  },
  {
    name           = "vh-service-web"
    custom_domain  = "vh-service-web.ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    priority       = 60

    disabled_rules = {}
  },
  {
    name             = "sds-api-mgmt"
    custom_domain    = "sds-api-mgmt.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsapimgmtithc.uksouth.cloudapp.azure.com"]
    priority         = 70
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    cache_enabled    = "false"
  }
]
