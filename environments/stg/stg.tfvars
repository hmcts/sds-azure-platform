project            = "sdshmcts"
location           = "uksouth"
env                = "stg"
subscription       = "stg"
oms_env            = "stg"
private_ip_address = "10.148.32.132"
destinations       = ["10.148.15.250", "10.148.31.250"]
vnet_rg            = "ss-stg-network-rg"
vnet_name          = "ss-stg-vnet"
hub                = "prod"
autoShutdown       = true
ssl_policy = {
  policy_type          = "Predefined"
  policy_name          = "AppGwSslPolicy20220101S"
  min_protocol_version = "TLSv1_2"
}
migration_variables = {
  trigger_migration            = false
  trigger_migration_temp_pip   = false
  temp_subnet_address_prefixes = "10.148.35.0/24"
}

key_vault_subscription        = "74dacd4f-a248-45bb-a2f0-af700dc4cf68"
hub_app_gw_private_ip_address = ["10.11.8.212"]
apim_appgw_backend_pool_fqdns = ["firewall-prod-int-palo-sdsapimgmtstg.uksouth.cloudapp.azure.com"]

frontends = [

  {
    name           = "toffee"
    custom_domain  = "toffee.staging.platform.hmcts.net"
    dns_zone_name  = "staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
  },
  {
    name           = "toffee-frontend-staging"
    custom_domain  = "toffee-frontend-staging.staging.platform.hmcts.net"
    dns_zone_name  = "staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
  },
  {
    name           = "c100-application"
    custom_domain  = "c100-application.staging.platform.hmcts.net"
    dns_zone_name  = "staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
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
    name           = "pip-frontend"
    custom_domain  = "pip-frontend.staging.platform.hmcts.net"
    dns_zone_name  = "staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
    redirect_url   = "https://pip-frontend.staging.platform.hmcts.net/unprocessed-request"

    disabled_rules = {
      LFI = [
        "930110" // false positive on multi-part uploads
      ]
    }

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
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "error_description"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
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
    ]
  },
  {
    name                = "pip-frontend-b2c-sign-in"
    custom_domain       = "sign-in.pip-frontend.staging.platform.hmcts.net"
    dns_zone_name       = "staging.platform.hmcts.net"
    backend_domain      = ["hmctspipnonprod.b2clogin.com"]
    host_header         = "hmctspipnonprod.b2clogin.com"
    forwarding_protocol = "HttpsOnly"
    cache_enabled       = false
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
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "csrf_token"
      }
    ]
  },
  {
    name                = "pip-frontend-b2c-staff"
    custom_domain       = "staff.pip-frontend.staging.platform.hmcts.net"
    dns_zone_name       = "staging.platform.hmcts.net"
    backend_domain      = ["hmctspipnonprod.b2clogin.com"]
    host_header         = "hmctspipnonprod.b2clogin.com"
    forwarding_protocol = "HttpsOnly"
    cache_enabled       = false
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
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "csrf_token"
      }
    ]
  },
  {
    name           = "vh-video-web"
    custom_domain  = "video.staging.hearings.reform.hmcts.net"
    dns_zone_name  = "staging.hearings.reform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
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
    custom_domain  = "admin.staging.hearings.reform.hmcts.net"
    dns_zone_name  = "staging.hearings.reform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
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
    name           = "pre-portal"
    custom_domain  = "pre-portal.staging.platform.hmcts.net"
    dns_zone_name  = "staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"

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
    }

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name           = "staging-casetracker"
    custom_domain  = "staging.casetracker.justice.gov.uk"
    dns_zone_name  = "casetracker.justice.gov.uk"
    backend_domain = ["dualstack.civil-loadb-105un4gbv5077-2040046462.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false

  },
  {
    name           = "staging-certificatedbailiffs"
    custom_domain  = "staging.certificatedbailiffs.justice.gov.uk"
    dns_zone_name  = "certificatedbailiffs.justice.gov.uk"
    backend_domain = ["dualstack.certi-loadb-vzujs6ulbuut-415542592.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false

  },
  {
    name           = "staging-courtfines"
    custom_domain  = "staging.courtfines.direct.gov.uk"
    dns_zone_name  = "courtfines.direct.gov.uk"
    backend_domain = ["dualstack.court-loadb-qpahtenf925i-482204730.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false

  },
  {
    name           = "staging-immigrationappealsonline"
    custom_domain  = "staging.immigrationappealsonline.justice.gov.uk"
    dns_zone_name  = "immigrationappealsonline.justice.gov.uk"
    backend_domain = ["dualstack.iacfees-s-ELBhmcts-DGD2EJ56UXEF-715536071.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false

  },
  {
    name             = "sds-api-mgmt"
    custom_domain    = "sds-api-mgmt.staging.platform.hmcts.net"
    dns_zone_name    = "staging.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-sdsapimgmtstg.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-stg-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name              = "staging-trib-land-reg-division"
    mode              = "Prevention"
    custom_domain     = "staging.landregistrationdivision.dsd.io"
    hosted_externally = true
    backend_domain    = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false


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
            "/Admin"]
          }
        ]
      }
    ]
  },
  {
    name              = "staging-trib-immigration-svcs"
    mode              = "Prevention"
    custom_domain     = "staging.immigrationservices.dsd.io"
    hosted_externally = true
    backend_domain    = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false


    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name              = "staging-trib-info-rights"
    mode              = "Prevention"
    custom_domain     = "staging.informationrights.dsd.io"
    hosted_externally = true
    backend_domain    = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false


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
    name              = "staging-trib-admin-appeals"
    mode              = "Prevention"
    custom_domain     = "staging.administrativeappeals.dsd.io"
    hosted_externally = true
    backend_domain    = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false


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
    name              = "staging-trib-care-standards"
    mode              = "Prevention"
    custom_domain     = "staging.carestandards.dsd.io"
    hosted_externally = true
    backend_domain    = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false


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
    name              = "staging-trib-lands-chamber"
    mode              = "Prevention"
    custom_domain     = "staging.landschamber.dsd.io"
    hosted_externally = true
    backend_domain    = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false


    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name              = "staging-trib-finance-tax"
    mode              = "Prevention"
    custom_domain     = "staging.financeandtax.dsd.io"
    hosted_externally = true
    backend_domain    = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false


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
    name              = "staging-trib-employment-appeals"
    mode              = "Prevention"
    custom_domain     = "staging.employmentappeals.dsd.io"
    hosted_externally = true
    backend_domain    = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false


    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
  },
  {
    name              = "staging-trib-tansport-appeals"
    mode              = "Prevention"
    custom_domain     = "staging.transportappeals.dsd.io"
    hosted_externally = true
    backend_domain    = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false


    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name              = "staging-trib-cicap"
    mode              = "Prevention"
    custom_domain     = "staging.cicap.dsd.io"
    hosted_externally = true
    backend_domain    = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app       = false


    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
  },
  {
    name                = "portal-stg"
    mode                = "Prevention"
    custom_domain       = "portal-stg.pre-recorded-evidence.justice.gov.uk"
    dns_zone_name       = "pre-recorded-evidence.justice.gov.uk"
    backend_domain      = ["pre-stg1.powerappsportals.com"]
    certificate_name    = "portal-stg-pre-recorded-evidence-justice-gov-uk"
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
    name           = "darts-portal"
    custom_domain  = "darts.staging.apps.hmcts.net"
    dns_zone_name  = "apps.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
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
  {
    name           = "juror-public"
    custom_domain  = "juror-public.staging.apps.hmcts.net"
    dns_zone_name  = "apps.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
    mode           = "Detection"
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
        "932110",
        "932115"
      ],
    }
  },
  {
    name           = "juror-bureau"
    custom_domain  = "juror.staging.apps.hmcts.net"
    dns_zone_name  = "apps.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
    mode           = "Detection"
    disabled_rules = {
      SQLI = [
        "942100",
        "942110",
        "942150",
        "942210",
        "942410",
        "942430",
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
    name           = "opal-frontend"
    custom_domain  = "opal-frontend.staging.platform.hmcts.net"
    dns_zone_name  = "staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
    disabled_rules = {
      SQLI = [
        "942440",
        "942430",
        "942450"
      ],
    }
    global_exclusions = []
  },
]

apim_appgw_exclusions = [
  {
    match_variable = "RequestArgNames"
    operator       = "Equals"
    selector       = "iss"
  }
]
