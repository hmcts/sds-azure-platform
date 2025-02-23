project            = "sdshmcts"
location           = "uksouth"
env                = "dev"
subscription       = "dev"
oms_env            = "dev"
private_ip_address = "10.145.32.132"
destinations       = ["10.145.31.250"]
vnet_rg            = "ss-dev-network-rg"
vnet_name          = "ss-dev-vnet"
hub                = "nonprod"
autoShutdown       = true
ssl_policy = {
  policy_type          = "Predefined"
  policy_name          = "AppGwSslPolicy20220101S"
  min_protocol_version = "TLSv1_2"
}
ssl_certificate = "wildcard-dev-platform-hmcts-net"

key_vault_subscription        = "867a878b-cb68-4de5-9741-361ac9e178b6"
hub_app_gw_private_ip_address = ["10.11.72.233"]
apim_appgw_backend_pool_fqdns = ["firewall-nonprodi-palo-sdsapimgmtdev.uksouth.cloudapp.azure.com"]
apim_appgw_min_capacity       = 1
apim_appgw_max_capacity       = 2

frontends = [

  {
    name           = "toffee"
    custom_domain  = "toffee.dev.platform.hmcts.net"
    dns_zone_name  = "dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
  },
  {
    name           = "vh-test-web"
    custom_domain  = "vh-test-web.dev.platform.hmcts.net"
    dns_zone_name  = "dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
    cache_enabled  = "false"

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
    custom_domain  = "vh-video-web.dev.platform.hmcts.net"
    dns_zone_name  = "dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
    cache_enabled  = "false"

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name           = "vh-video-web-reform"
    custom_domain  = "vh-video-web-dev.hearings.reform.hmcts.net"
    dns_zone_name  = "hearings.reform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]
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
    custom_domain  = "vh-admin-web.dev.platform.hmcts.net"
    dns_zone_name  = "dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
    cache_enabled  = "false"

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name           = "vh-video-web-pr-2142" # TO DO: REMOVE AFTER TESTING
    custom_domain  = "vh-video-web-pr-2142.dev.platform.hmcts.net"
    dns_zone_name  = "dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
    cache_enabled  = "false"

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name                = "portal-dev"
    mode                = "Prevention"
    custom_domain       = "portal-dev.pre-recorded-evidence.justice.gov.uk"
    dns_zone_name       = "pre-recorded-evidence.justice.gov.uk"
    backend_domain      = ["pre-dev.powerappsportals.com"]
    disabled_rules      = {}
    shutter_app         = false
    health_path         = "/SignIn?ReturnUrl=%2F"
    health_protocol     = "Https"
    forwarding_protocol = "HttpsOnly"
    cache_enabled       = "false"

    disabled_rules = {
      SQLI = [
        "942440",
        "942450",
      ],
      RCE = [
        "932100",
        "932110",
        "932115",
      ],
    }

    custom_rules = [
      {
        name     = "CountryMatchWhitelist"
        enabled  = true
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RemoteAddr"
            operator           = "GeoMatch"
            negation_condition = true
            match_values = [
              "GB"
            ]
          }
        ]
      }
    ]
  },
  {
    name           = "dev-casetracker"
    custom_domain  = "dev.casetracker.justice.gov.uk"
    dns_zone_name  = "casetracker.justice.gov.uk"
    backend_domain = ["civil-loadb-y5o7jqurq76d-2065714619.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = true
  },
  {
    name           = "dev-certificatedbailiffs"
    custom_domain  = "dev.certificatedbailiffs.justice.gov.uk"
    dns_zone_name  = "certificatedbailiffs.justice.gov.uk"
    backend_domain = ["certi-loadb-a49bsydpgeb7-1204811385.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = true
  },
  {
    name           = "dev-courtfines"
    custom_domain  = "dev.courtfines.direct.gov.uk"
    dns_zone_name  = "courtfines.direct.gov.uk"
    backend_domain = ["court-loadb-118vi6sleq8ii-1970392396.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = true
  },
  {
    name           = "dev-immigrationappealsonline"
    custom_domain  = "dev.immigrationappealsonline.justice.gov.uk"
    dns_zone_name  = "immigrationappealsonline.justice.gov.uk"
    backend_domain = ["iacfe-loadb-p3eli3f0pz30-1245399594.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = true
  },
  {
    name             = "sds-api-mgmt"
    custom_domain    = "sds-api-mgmt.dev.platform.hmcts.net"
    dns_zone_name    = "dev.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsapimgmtdev.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-dev-platform-hmcts-net"
    cache_enabled    = "false"
  },

  {
    name           = "pre-portal"
    custom_domain  = "pre-portal.dev.platform.hmcts.net"
    dns_zone_name  = "dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"

    disabled_rules = {
      SQLI = [
        "942440",
        "942450",
        "942200",
        "942370",
        "942260",
        "942340",
      ],
      RCE = [
        "932100",
        "932110",
        "932115",
      ],
    }

    custom_rules = [
      {
        name     = "CountryMatchWhitelist"
        enabled  = true
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RemoteAddr"
            operator           = "GeoMatch"
            negation_condition = true
            match_values = [
              "GB"
            ]
          }
        ]
      }
    ]

  },
  {
    name           = "darts-portal"
    custom_domain  = "darts.dev.platform.hmcts.net"
    dns_zone_name  = "dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"

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
        selector       = "error_description"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "darts_session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_policy"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "user_ids"
      },
    ]
  },
]

apim_appgw_exclusions = [
  {
    match_variable = "RequestArgNames"
    operator       = "Equals"
    selector       = "iss"
  }
]

traffic_manager_profiles = {
  ss-dev-mailrelay-tm = {
    protocol               = "TCP",
    port                   = "587",
    relative_name          = "ss-dev-mailrelay",
    resource_group_name    = "ss-dev-network-rg",
    traffic_routing_method = "Weighted",
    ttl                    = "180"
    endpoints = {
      fw-uksouth-nonprodi-palo-mailrelay0-pip = {
        target_resource_id = "/subscriptions/fb084706-583f-4c9a-bdab-949aac66ba5c/resourceGroups/hmcts-hub-nonprodi/providers/Microsoft.Network/publicIPAddresses/fw-uksouth-nonprodi-palo-mailrelay0-pip",
        weight             = "50"
      },
      fw-uksouth-nonprodi-palo-mailrelay1-pip = {
        target_resource_id = "/subscriptions/fb084706-583f-4c9a-bdab-949aac66ba5c/resourceGroups/hmcts-hub-nonprodi/providers/Microsoft.Network/publicIPAddresses/fw-uksouth-nonprodi-palo-mailrelay1-pip",
        weight             = "50"
      }
    }
  }
}
