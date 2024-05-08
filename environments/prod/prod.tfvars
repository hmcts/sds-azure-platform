project            = "sdshmcts"
location           = "uksouth"
env                = "prod"
subscription       = "prod"
oms_env            = "prod"
private_ip_address = "10.144.32.132"
destinations       = ["10.144.15.250", "10.144.31.250"]
vnet_rg            = "ss-prod-network-rg"
vnet_name          = "ss-prod-vnet"
shutter_rg         = "sds-platform-prod-rg"
cdn_sku            = "Standard_Verizon"
hub                = "prod"
apim_sku_name      = "Premium"
sku_tier           = "Standard"
sku_size           = "Standard"
ssl_policy = {
  policy_type          = "Predefined"
  policy_name          = "AppGwSslPolicy20220101S"
  min_protocol_version = "TLSv1_2"
}

key_vault_subscription        = "5ca62022-6aa2-4cee-aaa7-e7536c8d566c"
hub_app_gw_private_ip_address = ["10.11.8.200"]
apim_appgw_backend_pool_fqdns = ["firewall-prod-int-palo-sdsapimgmtprod.uksouth.cloudapp.azure.com"]

frontends = [
  {
    name           = "dts-legacy-apps---certificatedbailiffs"
    mode           = "Detection" #detection config set and PR raised 20 Dec 2021
    custom_domain  = "waf.certificatedbailiffs.justice.gov.uk"
    dns_zone_name  = "certificatedbailiffs.justice.gov.uk"
    backend_domain = ["dualstack.certi-loadb-q2s48nuaqsc6-1478330638.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
  },
  {
    name           = "dts-legacy-apps---civilappeals-casetracker"
    mode           = "Detection" #detection config set and PR raised 20 Dec 2021
    custom_domain  = "waf.casetracker.justice.gov.uk"
    dns_zone_name  = "casetracker.justice.gov.uk"
    backend_domain = ["dualstack.civil-loadb-qvbu457dp1b-1835055660.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
  },
  {
    name           = "dts-legacy-apps---courtfines"
    mode           = "Detection" #detection config set and PR raised 20 Dec 2021
    custom_domain  = "waf.courtfines.direct.gov.uk"
    dns_zone_name  = "courtfines.direct.gov.uk"
    backend_domain = ["dualstack.court-loadb-8mcola2l2by0-173012739.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
  },
  {
    name           = "dts-legacy-apps---immigration-appeals-iacfees"
    mode           = "Detection" #detection config set and PR raised 20 Dec 2021
    custom_domain  = "waf.immigrationappealsonline.justice.gov.uk"
    dns_zone_name  = "immigrationappealsonline.justice.gov.uk"
    backend_domain = ["dualstack.iacfees-p-elbhmcts-6jxi2y1j3cgc-1579084157.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
  },
  {
    name              = "dts-legacy-apps---redirect-service"
    mode              = "Detection" #detection config set and PR raised 20 Dec 2021
    custom_domain     = "proxywaf.digital.justice.gov.uk"
    dns_zone_name     = "digital.justice.gov.uk"
    backend_domain    = ["52.30.196.9"]
    shutter_app       = false
    hosted_externally = true
  },
  {
    name           = "dts-legacy-apps---utiac"
    mode           = "Detection" #detection config set and PR raised 20 Dec 2021
    custom_domain  = "waf.tribunalsdecisions.service.gov.uk"
    dns_zone_name  = "tribunalsdecisions.service.gov.uk"
    backend_domain = ["dualstack.dsd-apps-lb-01-1379550980.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
  },
  {
    name              = "trib-land-reg-division"
    mode              = "Prevention"
    custom_domain     = "landregistrationdivision.decisions.tribunals.gov.uk"
    dns_zone_name     = "decisions.tribunals.gov.uk"
    backend_domain    = ["dts-tribs-prod-1612499966.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false
    hosted_externally = true
    cache_enabled     = false

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
    custom_rules = [
      {
        name     = "AllowAllAdmin",
        type     = "MatchRule"
        priority = 1
        action   = "Allow"

        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
            "/Admin", "/Secure"]
          }
        ]
      }
    ]
  },
  {
    name              = "trib-immigration-svcs"
    mode              = "Prevention"
    custom_domain     = "immigrationservices.decisions.tribunals.gov.uk"
    dns_zone_name     = "decisions.tribunals.gov.uk"
    backend_domain    = ["dts-tribs-prod-1612499966.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false
    hosted_externally = true
    cache_enabled     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
    custom_rules = [
      {
        name     = "AllowAllAdmin",
        type     = "MatchRule"
        priority = 1
        action   = "Allow"

        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
            "/Admin", "/Secure"]
          }
        ]
      }
    ]
  },
  {
    name              = "trib-info-rights"
    mode              = "Prevention"
    custom_domain     = "informationrights.decisions.tribunals.gov.uk"
    dns_zone_name     = "decisions.tribunals.gov.uk"
    backend_domain    = ["dts-tribs-prod-1612499966.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false
    hosted_externally = true
    cache_enabled     = false

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
    custom_rules = [
      {
        name     = "AllowAllAdmin",
        type     = "MatchRule"
        priority = 1
        action   = "Allow"

        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
            "/Admin", "/Secure"]
          }
        ]
      }
    ]
  },
  {
    name              = "trib-admin-appeals"
    mode              = "Prevention"
    custom_domain     = "administrativeappeals.decisions.tribunals.gov.uk"
    dns_zone_name     = "decisions.tribunals.gov.uk"
    backend_domain    = ["dts-tribs-prod-1612499966.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false
    hosted_externally = true
    cache_enabled     = false

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
    custom_rules = [
      {
        name     = "AllowAllAdmin",
        type     = "MatchRule"
        priority = 1
        action   = "Allow"

        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
            "/Admin", "/Secure"]
          }
        ]
      }
    ]
  },
  {
    name              = "trib-care-standards"
    mode              = "Prevention"
    custom_domain     = "carestandards.decisions.tribunals.gov.uk"
    dns_zone_name     = "decisions.tribunals.gov.uk"
    backend_domain    = ["dts-tribs-prod-1612499966.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false
    hosted_externally = true
    cache_enabled     = false

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
    custom_rules = [
      {
        name     = "AllowAllAdmin",
        type     = "MatchRule"
        priority = 1
        action   = "Allow"

        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
            "/Admin", "/Secure"]
          }
        ]
      }
    ]
  },
  {
    name              = "trib-lands-chamber"
    mode              = "Prevention"
    custom_domain     = "landschamber.decisions.tribunals.gov.uk"
    dns_zone_name     = "decisions.tribunals.gov.uk"
    backend_domain    = ["dts-tribs-prod-1612499966.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false
    hosted_externally = true
    cache_enabled     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
    custom_rules = [
      {
        name     = "AllowAllAdmin",
        type     = "MatchRule"
        priority = 1
        action   = "Allow"

        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
            "/Admin", "/Secure"]
          }
        ]
      }
    ]
  },
  {
    name              = "trib-finance-tax"
    mode              = "Prevention"
    custom_domain     = "financeandtax.decisions.tribunals.gov.uk"
    dns_zone_name     = "decisions.tribunals.gov.uk"
    backend_domain    = ["dts-tribs-prod-1612499966.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false
    hosted_externally = true
    cache_enabled     = false

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
    custom_rules = [
      {
        name     = "AllowAllAdmin",
        type     = "MatchRule"
        priority = 1
        action   = "Allow"

        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
            "/Admin", "/Secure"]
          }
        ]
      }
    ]
  },
  {
    name              = "trib-employment-appeals"
    mode              = "Prevention"
    custom_domain     = "employmentappeals.decisions.tribunals.gov.uk"
    dns_zone_name     = "decisions.tribunals.gov.uk"
    backend_domain    = ["dts-tribs-prod-1612499966.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false
    hosted_externally = true
    cache_enabled     = false
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
    custom_rules = [
      {
        name     = "AllowAllAdmin",
        type     = "MatchRule"
        priority = 1
        action   = "Allow"

        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
            "/Admin", "/Secure"]
          }
        ]
      }
    ]
  },
  {
    name              = "trib-tansport-appeals"
    mode              = "Prevention"
    custom_domain     = "transportappeals.decisions.tribunals.gov.uk"
    dns_zone_name     = "decisions.tribunals.gov.uk"
    backend_domain    = ["dts-tribs-prod-1612499966.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false
    hosted_externally = true
    cache_enabled     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
    custom_rules = [
      {
        name     = "AllowAllAdmin",
        type     = "MatchRule"
        priority = 1
        action   = "Allow"

        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
            "/Admin", "/Secure"]
          }
        ]
      }
    ]
  },
  {
    name              = "trib-cicap"
    mode              = "Prevention"
    custom_domain     = "cicap.decisions.tribunals.gov.uk"
    dns_zone_name     = "decisions.tribunals.gov.uk"
    backend_domain    = ["dts-tribs-prod-1612499966.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false
    hosted_externally = true
    cache_enabled     = false
    disabled_rules = {
      LFI = [
        "930110", // false positive on multi-part uploads
        "930100",
        "930120"
      ],
      RFI = [
        "931130"
      ],
      SQLI = [
        "942100",
        "942150",
        "942110",
        "942180",
        "942260",
        "942160",
        "942190"
      ],
      XSS = [
        "941100",
        "941130",
        "941110",
        "941160",
        "941170",
        "941120",
        "941210",
        "941150",
        "941180",
        "941140",
        "941320"
      ],
      RCE = [
        "932130",
        "932100",
        "932160",
        "932170",
        "932110"
      ],
      JAVA = [
        "944100",
        "944240"
      ],
      PHP = [
        "933100"
      ]

    },
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
    custom_rules = [
      {
        name     = "AllowAllAdmin",
        type     = "MatchRule"
        priority = 1
        action   = "Allow"

        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
            "/Admin", "/Secure"]
          }
        ]
      }
    ]
  },
  {
    name             = "jd-bureau"
    custom_domain    = "juror-bureau.justice.gov.uk"
    dns_zone_name    = "juror-bureau.justice.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    shutter_app      = true
    ssl_mode         = "AzureKeyVault"
    certificate_name = "juror-bureau-justice-gov-uk"

    session_affinity             = true
    session_affinity_ttl_seconds = 14400
    appgw_cookie_based_affinity  = "Enabled"

    mode        = "Prevention"
    health_path = "/"
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
              "51.149.249.0/27",
              "194.33.196.0/25",
              "51.149.249.32/27",
              "195.59.75.0/24",
              "158.234.251.0/24",
              "158.234.250.0/24",
              "213.121.161.124/32",
              "51.145.4.100/32",
              "185.125.224.42",
              "62.254.63.52",
              "51.149.250.0/24",
              "194.33.249.0/29",
              "194.33.248.0/29",
              "20.49.214.199/32",
              "20.49.214.228/32",
              "193.237.208.55/32",
            ]
          }
        ]
      },
    ],
  },

  {
    name                         = "jd-reply-jury-summons"
    custom_domain                = "reply-jury-summons.service.gov.uk"
    dns_zone_name                = "reply-jury-summons.service.gov.uk"
    backend_domain               = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    shutter_app                  = true
    ssl_mode                     = "AzureKeyVault"
    certificate_name             = "reply-jury-summons-service-gov-uk"
    session_affinity             = true
    session_affinity_ttl_seconds = 14400
    appgw_cookie_based_affinity  = "Enabled"

    mode           = "Detection"
    health_path    = "/"
    disabled_rules = {}
  },
  {
    name             = "court-tribunal-hearings"
    custom_domain    = "www.court-tribunal-hearings.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-platform-hmcts-net"
    dns_zone_name    = "court-tribunal-hearings.service.gov.uk"
    redirect_url     = "https://www.court-tribunal-hearings.service.gov.uk/unprocessed-request"
    disabled_rules   = {}
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
        selector       = "court-and-tribunal-hearings-cookie-preferences"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "createAdminAccount"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "session.sig"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "error_description"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "subscriptions"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      }
    ],
    disabled_rules = {
      LFI = [
        "930110" // false positive on multi-part uploads
      ]
    },
    custom_rules = [
      {
        name     = "ManualUploadPathTraversalGeneral",
        type     = "MatchRule"
        priority = 1
        action   = "Redirect"

        match_conditions = [
          {
            match_variable     = "RequestBody"
            operator           = "Contains"
            negation_condition = false
            transforms         = ["UrlDecode"]
            match_values       = ["../", "..\\"]
          },
          {
            match_variable     = "RequestUri"
            operator           = "EndsWith"
            negation_condition = true
            match_values       = ["/manual-upload"]
          },
          {
            match_variable     = "RequestMethod"
            operator           = "Equal"
            negation_condition = false
            match_values       = ["POST"]
          }
        ]
      },
      {
        name     = "ManualUploadPathTraversalNonEncode",
        type     = "MatchRule"
        priority = 2
        action   = "Redirect"

        match_conditions = [
          {
            match_variable     = "RequestBody"
            operator           = "Contains"
            negation_condition = false
            match_values       = ["..%c0%af", "..%c1%9c"]
          },
          {
            match_variable     = "RequestUri"
            operator           = "EndsWith"
            negation_condition = true
            match_values       = ["/manual-upload"]
          },
          {
            match_variable     = "RequestMethod"
            operator           = "Equal"
            negation_condition = false
            match_values       = ["POST"]
          }
        ]
      },
      {
        name     = "ManualUploadPathTraversalRegex",
        type     = "MatchRule"
        priority = 3
        action   = "Redirect"

        match_conditions = [
          {
            match_variable     = "RequestBody"
            operator           = "RegEx"
            negation_condition = false
            transforms         = ["Lowercase"]
            match_values       = ["([a-z]:\\\\)|(%252e|\\.)(%252e|\\.)(%255c|%252f|\\\\|\\/)"]
          },
          {
            match_variable     = "RequestUri"
            operator           = "EndsWith"
            negation_condition = true
            match_values       = ["/manual-upload"]
          },
          {
            match_variable     = "RequestMethod"
            operator           = "Equal"
            negation_condition = false
            match_values       = ["POST"]
          }
        ]
      }
    ]
  },
  {
    name                = "court-tribunal-hearings-b2c-sign-in"
    custom_domain       = "sign-in.court-tribunal-hearings.service.gov.uk"
    dns_zone_name       = "court-tribunal-hearings.service.gov.uk"
    backend_domain      = ["hmctspipprod.b2clogin.com"]
    host_header         = "hmctspipprod.b2clogin.com"
    forwarding_protocol = "HttpsOnly"
    cache_enabled       = false
    certificate_name    = "wildcard-court-tribunal-hearings-service-gov-uk"
    ssl_mode            = "AzureKeyVault"
    shutter_app         = false
    disabled_rules      = {}
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "desc"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "StartsWith"
        selector       = "x-ms-cpim-"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "diags"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "error_description"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "claim_value"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "ReadOnlyEmail"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "nonce"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      }
    ]
  },
  {
    name                = "court-tribunal-hearings-b2c-staff"
    custom_domain       = "staff.court-tribunal-hearings.service.gov.uk"
    dns_zone_name       = "court-tribunal-hearings.service.gov.uk"
    backend_domain      = ["hmctspipprod.b2clogin.com"]
    host_header         = "hmctspipprod.b2clogin.com"
    forwarding_protocol = "HttpsOnly"
    cache_enabled       = false
    certificate_name    = "wildcard-court-tribunal-hearings-service-gov-uk"
    ssl_mode            = "AzureKeyVault"
    shutter_app         = false
    disabled_rules      = {}
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "desc"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "StartsWith"
        selector       = "x-ms-cpim-"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "diags"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "error_description"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "claim_value"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "ReadOnlyEmail"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "nonce"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      }
    ]
  },
  {
    name             = "vh-video-web"
    custom_domain    = "video.hearings.reform.hmcts.net"
    dns_zone_name    = "hearings.reform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-hearings-reform-hmcts-net"
    disabled_rules   = {}
    cache_enabled    = "false"
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name                  = "vh-admin-web"
    custom_domain         = "admin.hearings.reform.hmcts.net"
    dns_zone_name         = "hearings.reform.hmcts.net"
    backend_domain        = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    certificate_name      = "wildcard-hearings-reform-hmcts-net"
    disabled_rules        = {}
    cache_enabled         = "false"
    shutter_name_override = "vh-admin-web"

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name             = "toffee"
    custom_domain    = "toffee.platform.hmcts.net"
    dns_zone_name    = "platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-platform-hmcts-net"
    disabled_rules   = {}
  },
  {
    product       = "netbox"
    name          = "netbox"
    custom_domain = "netbox.platform.hmcts.net"
    dns_zone_name = "platform.hmcts.net"
    shutter_app   = false
    redirect      = "netbox.hmcts.net"
  },
  {
    name             = "pre-portal"
    custom_domain    = "pre-portal.platform.hmcts.net"
    dns_zone_name    = "platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-platform-hmcts-net"
    disabled_rules = {
      SQLI = [
        "942200",
        "942370",
        "942260",
        "942340",
        "942440",
        "942450",
        "942110",
        "942430",
      ],
    }
  },
  {
    name             = "sds-api-mgmt"
    custom_domain    = "sds-api-mgmt.platform.hmcts.net"
    dns_zone_name    = "platform.hmcts.net"
    shutter_app      = false
    backend_domain   = ["firewall-prod-int-palo-sdsapimgmtprod.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name             = "c100-application"
    custom_domain    = "c100-application.platform.hmcts.net"
    dns_zone_name    = "platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-platform-hmcts-net"
    shutter_app      = false
    health_path      = "/status"
    mode             = "Detection"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_c100_application_session"
      }
    ]
  },
  {
    name                = "portal"
    mode                = "Prevention"
    custom_domain       = "portal.pre-recorded-evidence.justice.gov.uk"
    dns_zone_name       = "pre-recorded-evidence.justice.gov.uk"
    backend_domain      = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    certificate_name    = "www-portal-pre-recorded-evidence-justice-gov-uk"
    disabled_rules      = {}
    shutter_app         = false
    forwarding_protocol = "HttpsOnly"
    cache_enabled       = "false"
    disabled_rules = {
      SQLI = [
        "942200",
        "942370",
        "942260",
        "942340",
        "942440",
        "942450",
        "942430",
      ],
    },
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ],

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
    name           = "juror-public"
    custom_domain  = "juror-public.apps.hmcts.net"
    dns_zone_name  = "apps.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
    mode           = "Prevention"
    disabled_rules = {
      SQLI = [
        "942120",
        "942200",
        "942210",
        "942260",
        "942310",
        "942430",
        "942440",
        "942450"
      ],
      RCE = [
        "932100",
        "932115"
      ],
    }
  },
  {
    name           = "juror-bureau"
    custom_domain  = "juror.apps.hmcts.net"
    dns_zone_name  = "apps.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
    mode           = "Prevention"
    disabled_rules = {
      SQLI = [
        "942100",
        "942150",
        "942210",
        "942410",
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
              "51.149.250.0/23"
            ]
          }
        ]
      }
    ]
  },
  {
    name          = "ejudiciary-home"
    custom_domain = "home.ejudiciary.net"
    dns_zone_name = "ejudiciary.net"
    shutter_app   = false
    redirect      = "judiciary.sharepoint.com"
  },
  {
    name             = "ejudiciary-home-apex"
    custom_domain    = "ejudiciary.net"
    dns_zone_name    = "ejudiciary.net"
    ssl_mode         = "AzureKeyVault"
    shutter_app      = false
    redirect         = "judiciary.sharepoint.com"
    certificate_name = "ejudiciary-net"
  },
  {
    name          = "ejudiciary-home-www"
    custom_domain = "www.ejudiciary.net"
    dns_zone_name = "ejudiciary.net"
    shutter_app   = false
    redirect      = "judiciary.sharepoint.com"
  },
  {
    name          = "sds-sandbox-build"
    custom_domain = "sds-sandbox-build.platform.hmcts.net"
    dns_zone_name = "platform.hmcts.net"
    shutter_app   = false
    redirect      = "sds-sandbox-build.hmcts.net"
  },
  {
    name          = "static-sds-sandbox-build"
    custom_domain = "static-sds-sandbox-build.platform.hmcts.net"
    dns_zone_name = "platform.hmcts.net"
    shutter_app   = false
    redirect      = "static-sds-sandbox-build.hmcts.net"
  },
  {
    name          = "sds-build"
    custom_domain = "sds-build.platform.hmcts.net"
    dns_zone_name = "platform.hmcts.net"
    shutter_app   = false
    redirect      = "sds-build.hmcts.net"
  },
]


traffic_manager_profiles = {
  ss-prod-mailrelay-tm = {
    protocol               = "TCP",
    port                   = "587",
    relative_name          = "ss-prod-mailrelay",
    resource_group_name    = "ss-prod-network-rg",
    traffic_routing_method = "Weighted",
    ttl                    = "180"
    endpoints = {
      fw-uksouth-prod-int-palo-mailrelay0-pip = {
        target_resource_id = "/subscriptions/0978315c-75fe-4ada-9d11-1eb5e0e0b214/resourceGroups/hmcts-hub-prod-int/providers/Microsoft.Network/publicIPAddresses/fw-uksouth-prod-int-palo-mailrelay0-pip",
      },
      fw-uksouth-prod-int-palo-mailrelay1-pip = {
        profile_name        = "ss-prod-mailrelay-tm",
        resource_group_name = "ss-prod-network-rg",
        target_resource_id  = "/subscriptions/0978315c-75fe-4ada-9d11-1eb5e0e0b214/resourceGroups/hmcts-hub-prod-int/providers/Microsoft.Network/publicIPAddresses/fw-uksouth-prod-int-palo-mailrelay1-pip",
      }
    }
  }
}

apim_appgw_exclusions = [
  {
    match_variable = "RequestArgNames"
    operator       = "Equals"
    selector       = "iss"
  }
]
