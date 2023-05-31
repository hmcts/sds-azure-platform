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
ssl_policy = {
  policy_type          = "Predefined"
  policy_name          = "AppGwSslPolicy20220101S"
  min_protocol_version = "TLSv1_2"
}

key_vault_subscription        = "ba71a911-e0d6-4776-a1a6-079af1df7139"
hub_app_gw_private_ip_address = ["10.11.72.236"]
apim_appgw_backend_pool_fqdns = ["firewall-nonprodi-palo-sdsapimgmtithc.uksouth.cloudapp.azure.com"]
apim_appgw_min_capacity       = 1
apim_appgw_max_capacity       = 2

frontends = [

  {
    name                  = "toffee"
    custom_domain         = "toffee.ithc.platform.hmcts.net"
    backend_domain        = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    disabled_rules        = {}
    shutter_name_override = "false"
  },
  {
    name                  = "c100-application"
    custom_domain         = "c100-application.ithc.platform.hmcts.net"
    backend_domain        = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    disabled_rules        = {}
    health_path           = "/status"
    mode                  = "Detection"
    shutter_name_override = "false"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_c100_application_session"
      }
    ]
  },
  {
    name                  = "pip-frontend"
    custom_domain         = "pip-frontend.ithc.platform.hmcts.net"
    backend_domain        = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    certificate_name      = "wildcard-platform-hmcts-net"
    shutter_app           = true
    disabled_rules        = {}
    global_exclusions     = []
    shutter_name_override = "false"
  },
  {
    name           = "vh-test-web"
    custom_domain  = "vh-test-web.ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"

    disabled_rules        = {}
    shutter_name_override = "false"

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name           = "vh-video-web"
    custom_domain  = "vh-video-web.ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"

    disabled_rules        = {}
    shutter_name_override = "false"

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name           = "vh-admin-web"
    custom_domain  = "vh-admin-web.ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"

    disabled_rules        = {}
    shutter_name_override = "false"

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name                  = "vh-service-web"
    custom_domain         = "vh-service-web.ithc.platform.hmcts.net"
    backend_domain        = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    shutter_name_override = "false"

    disabled_rules = {}
  },
  {
    name                  = "sds-api-mgmt"
    custom_domain         = "sds-api-mgmt.ithc.platform.hmcts.net"
    backend_domain        = ["firewall-nonprodi-palo-sdsapimgmtithc.uksouth.cloudapp.azure.com"]
    certificate_name      = "wildcard-ithc-platform-hmcts-net"
    cache_enabled         = "false"
    shutter_name_override = "false"
  }
]

apim_appgw_exclusions = [
  {
    match_variable = "RequestArgNames"
    operator       = "Equals"
    selector       = "iss"
  }
]
