project            = "sdshmcts"
location           = "uksouth"
env                = "demo"
subscription       = "demo"
oms_env            = "demo"
private_ip_address = "10.51.96.133"
destinations       = ["10.51.79.250"]
vnet_rg            = "ss-demo-network-rg"
vnet_name          = "ss-demo-vnet"
hub                = "nonprod"

frontends = [
  {
    name             = "sds-api-mgmt"
    custom_domain    = "sds-api-mgmt.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsapimgmtdemo.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name             = "c100-application"
    custom_domain    = "c100-application.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsapimgmtdemo.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"
    mode             = "Detection"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_c100_application_session"
      }
    ]
  }
]
