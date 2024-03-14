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
autoShutdown       = true
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
    name           = "toffee"
    custom_domain  = "toffee.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
  },
  {
    name           = "c100-application"
    custom_domain  = "c100-application.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
    health_path    = "/status"
    mode           = "Detection"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_c100_application_session"
      }
    ]
  },
  {
    name              = "pip-frontend"
    custom_domain     = "pip-frontend.ithc.platform.hmcts.net"
    dns_zone_name     = "ithc.platform.hmcts.net"
    backend_domain    = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    certificate_name  = "wildcard-platform-hmcts-net"
    shutter_app       = true
    disabled_rules    = {}
    global_exclusions = []
  },
  {
    name           = "vh-test-web"
    custom_domain  = "vh-test-web.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"

    disabled_rules = {}

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
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"

    disabled_rules = {}

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
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"

    disabled_rules = {}

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name           = "vh-service-web"
    custom_domain  = "vh-service-web.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name             = "sds-api-mgmt"
    custom_domain    = "sds-api-mgmt.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsapimgmtithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name           = "juror-public"
    custom_domain  = "juror-public.ithc.apps.hmcts.net"
    dns_zone_name  = "apps.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
    mode           = "Detection"
    disabled_rules = {
      SQLI = [
        "942200",
        "942260",
        "942440"
      ],
      RCE = [
        "932100"
      ],
    }
  },
  {
    name           = "juror-bureau"
    custom_domain  = "juror.ithc.apps.hmcts.net"
    dns_zone_name  = "apps.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
    mode           = "Detection"
    disabled_rules = {
      SQLI = [
        "942440",
        "942450"
      ],
      RCE = [
        "932100"
      ],
    }
    custom_rules = [
      {
        name     = "IPMatchWhitelist"
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RemoteAddr"
            operator           = "IPMatch"
            negation_condition = true
            match_values = [
              "194.33.192.0/24",
              "194.33.196.0/24",
              "194.33.200.0/21",
              "194.33.248.0/24",
              "194.33.249.0/24",
              "51.149.249.0/27",
              "51.149.249.32/27",
              "51.149.250.0/23",
              "195.59.75.0/24",
              "20.58.23.145/32",
              "20.50.108.242/32",
              "20.50.109.148/32"
            ]
          }
        ]
      }
    ]
  },
  {
    product        = "darts-portal"
    name           = "darts-portal"
    custom_domain  = "darts.ithc.apps.hmcts.net"
    dns_zone_name  = "apps.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
    disabled_rules = {
      SQLI = [
        "942430",
      ]
    }
  }
]

apim_appgw_exclusions = [
  {
    match_variable = "RequestArgNames"
    operator       = "Equals"
    selector       = "iss"
  }
]
