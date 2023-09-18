project            = "sdshmcts"
location           = "uksouth"
env                = "dev"
subscription       = "dev"
oms_env            = "dev"
private_ip_address = "10.145.32.132"
destinations       = ["10.145.15.250", "10.145.31.250"]
vnet_rg            = "ss-dev-network-rg"
vnet_name          = "ss-dev-vnet"
hub                = "nonprod"
autoShutdown       = true
ssl_policy = {
  policy_type          = "Predefined"
  policy_name          = "AppGwSslPolicy20220101S"
  min_protocol_version = "TLSv1_2"
}

key_vault_subscription        = "867a878b-cb68-4de5-9741-361ac9e178b6"
hub_app_gw_private_ip_address = ["10.11.72.233"]
apim_appgw_backend_pool_fqdns = ["firewall-nonprodi-palo-sdsapimgmtdev.uksouth.cloudapp.azure.com"]
apim_appgw_min_capacity       = 1
apim_appgw_max_capacity       = 2

frontends = [

  {
    name           = "toffee"
    custom_domain  = "toffee.dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
  },

  {
    name           = "jd-bureau"
    custom_domain  = "jdbureau.dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]

    mode                         = "Prevention"
    health_path                  = "/"
    session_affinity             = true
    session_affinity_ttl_seconds = 14400
    appgw_cookie_based_affinity  = "Enabled"
    disabled_rules = {
      JAVA = [
        "944250",
        "944240",
        "944210",
        "944200",
        "944130",
        "944120",
        "944110",
        "944100",
      ],
      FIX = [
        "943120",
        "943110",
        "943100",
      ],
      SQLI = [
        "942480",
        "942470",
        "942450",
        "942440",
        "942430",
        "942410",
        "942400",
        "942390",
        "942380",
        "942370",
        "942361",
        "942360",
        "942350",
        "942340",
        "942330",
        "942320",
        "942310",
        "942300",
        "942290",
        "942280",
        "942270",
        "942260",
        "942250",
        "942240",
        "942230",
        "942220",
        "942210",
        "942200",
        "942190",
        "942180",
        "942170",
        "942160",
        "942150",
        "942140",
        "942120",
        "942110",
        "942100",
      ],
      XSS = [
        "941350",
        "941340",
        "941330",
        "941320",
        "941310",
        "941300",
        "941290",
        "941280",
        "941270",
        "941260",
        "941250",
        "941240",
        "941230",
        "941220",
        "941210",
        "941200",
        "941190",
        "941180",
        "941170",
        "941160",
        "941150",
        "941140",
        "941130",
        "941120",
        "941110",
        "941101",
        "941100",
      ],
      PHP = [
        "933180",
        "933170",
        "933160",
        "933151",
        "933150",
        "933140",
        "933130",
        "933120",
        "933110",
        "933100",
      ],
      RCE = [
        "932180",
        "932171",
        "932170",
        "932160",
        "932150",
        "932140",
        "932130",
        "932120",
        "932115",
        "932110",
        "932105",
        "932100",
      ],
      RFI = [
        "931130",
        "931120",
        "931110",
        "931100",
      ],
      LFI = [
        "930130",
        "930120",
        "930110",
        "930100",
      ],
      PROTOCOL-ATTACK = [
        "921151",
        "921160",
        "921150",
        "921140",
        "921130",
        "921120",
        "921110",
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
              "81.134.202.29/32",
              "51.145.6.230/32",
              "194.33.192.0/25",
              "194.33.196.0/25",
              "195.59.75.0/24",
              "158.234.251.0/24",
              "158.234.250.0/24",
              "213.121.161.124/32",
              "51.145.4.100/32",
              "185.125.224.42",
              "62.254.63.52",
              "51.149.249.0/27",
              "51.149.249.32/27",
              "51.149.250.0/24",
              "194.33.249.0/29",
              "194.33.248.0/29",
              "20.49.214.199/32",
              "20.49.214.228/32",
            ]
          }
        ]
      },
    ],
  },

  {
    name           = "jd-public"
    custom_domain  = "jdfrontend.dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]

    mode                         = "Detection"
    health_path                  = "/"
    session_affinity             = true
    session_affinity_ttl_seconds = 14400
    appgw_cookie_based_affinity  = "Enabled"

    disabled_rules = {}
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
              "81.134.202.29/32",
              "51.145.6.230/32",
              "194.33.192.0/25",
              "51.149.249.0/27",
              "194.33.196.0/25",
              "51.149.249.32/27",
              "195.59.75.0/24",
              "158.234.251.0/24",
              "158.234.250.0/24",
              "213.121.161.124/32",
              "51.145.4.100/32"
            ]
          }
        ]
      },
    ],
  },
  {
    name           = "vh-test-web"
    custom_domain  = "vh-test-web.dev.platform.hmcts.net"
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
    name           = "vh-video-web-pr-2057" # TO DO: REMOVE AFTER TESTING
    custom_domain  = "vh-video-web-pr-2057.dev.platform.hmcts.net"
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
    backend_domain = ["civil-loadb-y5o7jqurq76d-2065714619.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = true
  },
  {
    name           = "dev-certificatedbailiffs"
    custom_domain  = "dev.certificatedbailiffs.justice.gov.uk"
    backend_domain = ["certi-loadb-a49bsydpgeb7-1204811385.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = true
  },
  {
    name           = "dev-courtfines"
    custom_domain  = "dev.courtfines.direct.gov.uk"
    backend_domain = ["court-loadb-118vi6sleq8ii-1970392396.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = true
  },
  {
    name           = "dev-immigrationappealsonline"
    custom_domain  = "dev.immigrationappealsonline.justice.gov.uk"
    backend_domain = ["iacfe-loadb-p3eli3f0pz30-1245399594.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = true
  },
  {
    name             = "sds-api-mgmt"
    custom_domain    = "sds-api-mgmt.dev.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsapimgmtdev.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-dev-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name           = "dev-trib-land-reg-division"
    mode           = "Prevention"
    custom_domain  = "dev.landregistrationdivision.dsd.io"
    backend_domain = ["dts-tribs-dev-317402065.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "ddlScat1"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__EVENTVALIDATION"
      }
    ]
  },
  {
    name           = "dev-trib-immigration-svcs"
    mode           = "Prevention"
    custom_domain  = "dev.immigrationservices.dsd.io"
    backend_domain = ["dts-tribs-dev-317402065.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name           = "dev-trib-info-rights"
    mode           = "Prevention"
    custom_domain  = "dev.informationrights.dsd.io"
    backend_domain = ["dts-tribs-dev-317402065.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__EVENTVALIDATION"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "ddlTax3"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "ddlTax2"
      }
    ]
  },
  {
    name           = "dev-trib-admin-appeals"
    mode           = "Prevention"
    custom_domain  = "dev.administrativeappeals.dsd.io"
    backend_domain = ["dts-tribs-dev-317402065.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name           = "dev-trib-care-standards"
    mode           = "Prevention"
    custom_domain  = "dev.carestandards.dsd.io"
    backend_domain = ["dts-tribs-dev-317402065.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__EVENTVALIDATION"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "drpMainCategory"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "InitialBodyContents"
      }
    ]
  },
  {
    name           = "dev-trib-lands-chamber"
    mode           = "Prevention"
    custom_domain  = "dev.landschamber.dsd.io"
    backend_domain = ["dts-tribs-dev-317402065.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name           = "dev-trib-finance-tax"
    mode           = "Prevention"
    custom_domain  = "dev.financeandtax.dsd.io"
    backend_domain = ["dts-tribs-dev-317402065.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    disabled_rules = {
      SQLI = [
        "942430", // false positive on /Admin/Commissioners.aspx
      ]
      LFI = [
        "930110", // false positive on multi-part uploads
      ]
    }
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "InitialBodyContents"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "txtClaimant"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
  },
  {
    name           = "dev-trib-employment-appeals"
    mode           = "Prevention"
    custom_domain  = "dev.employmentappeals.dsd.io"
    backend_domain = ["dts-tribs-dev-317402065.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
  },
  {
    name           = "dev-trib-tansport-appeals"
    mode           = "Prevention"
    custom_domain  = "dev.transportappeals.dsd.io"
    backend_domain = ["dts-tribs-dev-317402065.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name             = "pre-portal"
    custom_domain    = "pre-portal.dev.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-dev-platform-hmcts-net"
    cache_enabled    = "false"

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
    name           = "dev-trib-cicap"
    mode           = "Prevention"
    custom_domain  = "dev.cicap.dsd.io"
    backend_domain = ["dts-tribs-dev-317402065.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
  },
  {
    name           = "darts-portal"
    custom_domain  = "darts-portal.dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
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
