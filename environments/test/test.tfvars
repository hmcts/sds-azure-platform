project            = "sdshmcts"
location           = "uksouth"
env                = "test"
subscription       = "test"
oms_env            = "test"
private_ip_address = "10.141.32.132"
destinations       = ["10.141.15.250", "10.141.31.250"]
vnet_rg            = "ss-test-network-rg"
vnet_name          = "ss-test-vnet"
hub                = "nonprod"

frontends = [

  {
    name           = "toffee"
    custom_domain  = "toffee.test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },

  {
    name           = "pip-frontend"
    custom_domain  = "pip-frontend.test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
    
    global_exclusions = [
      ## Open ID response parameters
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "state"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "formCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookiePolicy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "createAdminAccount"
      }
    ]
  },
  {
    name           = "vh-test-web"
    custom_domain  = "vh-test-web.test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-video-web"
    custom_domain  = "vh-video-web.test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-admin-web"
    custom_domain  = "vh-admin-web.test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-service-web"
    custom_domain  = "vh-service-web.test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name             = "sds-api-mgmt"
    custom_domain    = "sds-api-mgmt.test.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-hmiapimtest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-test-platform-hmcts-net"
    cache_enabled    = "false"
  }
]
