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
autoShutdown       = true
ssl_policy = {
  policy_type          = "Predefined"
  policy_name          = "AppGwSslPolicy20220101S"
  min_protocol_version = "TLSv1_2"
}

key_vault_subscription        = "3eec5bde-7feb-4566-bfb6-805df6e10b90"
hub_app_gw_private_ip_address = ["10.11.72.239"]
apim_appgw_backend_pool_fqdns = ["firewall-nonprodi-palo-sdsapimgmttest.uksouth.cloudapp.azure.com"]
apim_appgw_min_capacity       = 1
apim_appgw_max_capacity       = 2

frontends = [

  {
    name           = "toffee"
    custom_domain  = "toffee.test.platform.hmcts.net"
    dns_zone_name  = "test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
  },
  {
    product        = "darts-portal"
    name           = "darts-portal"
    custom_domain  = "darts.test.apps.hmcts.net"
    dns_zone_name  = "apps.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
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
  {
    name           = "pip-frontend"
    custom_domain  = "pip-frontend.test.platform.hmcts.net"
    dns_zone_name  = "test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
    redirect_url   = "https://pip-frontend.test.platform.hmcts.net/unprocessed-request"

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
    custom_domain       = "sign-in.pip-frontend.test.platform.hmcts.net"
    dns_zone_name       = "test.platform.hmcts.net"
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
      }
    ]
  },
  {
    name                = "pip-frontend-b2c-staff"
    custom_domain       = "staff.pip-frontend.test.platform.hmcts.net"
    dns_zone_name       = "test.platform.hmcts.net"
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
      }
    ]
  },
  {
    name           = "vh-test-web"
    custom_domain  = "vh-test-web.test.platform.hmcts.net"
    dns_zone_name  = "test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
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
    custom_domain  = "vh-video-web.test.platform.hmcts.net"
    dns_zone_name  = "test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
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
    custom_domain  = "vh-admin-web.test.platform.hmcts.net"
    dns_zone_name  = "test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
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
    name             = "sds-api-mgmt"
    custom_domain    = "sds-api-mgmt.test.platform.hmcts.net"
    dns_zone_name    = "test.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsapimgmttest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-test-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name                = "portal-test"
    mode                = "Prevention"
    custom_domain       = "portal-test.pre-recorded-evidence.justice.gov.uk"
    dns_zone_name       = "pre-recorded-evidence.justice.gov.uk"
    backend_domain      = ["pre-testing.powerappsportals.com"]
    certificate_name    = "portal-test-pre-recorded-evidence-justice-gov-uk"
    disabled_rules      = {}
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
    name           = "pre-portal"
    mode           = "Detection"
    custom_domain  = "pre-portal.test.platform.hmcts.net"
    dns_zone_name  = "test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
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
      RCE = [
        "932100",
        "932110",
        "932115",
      ],
    }
    health_protocol     = "Https"
    forwarding_protocol = "HttpsOnly"
    cache_enabled       = "false"

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
    custom_domain  = "juror-public.test.apps.hmcts.net"
    dns_zone_name  = "apps.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
    mode           = "Prevention"
    disabled_rules = {
      SQLI = [
        "942100",
        "942110",
        "942120",
        "942150",
        "942180",
        "942190",
        "942200",
        "942210",
        "942230",
        "942240",
        "942260",
        "942310",
        "942340",
        "942380",
        "942390",
        "942400",
        "942410",
        "942430",
        "942440",
        "942450"
      ],
      RCE = [
        "932100",
        "932105",
        "932110",
        "932115",
        "932150"
      ],
    }
  },
  {
    name           = "juror-bureau"
    custom_domain  = "juror.test.apps.hmcts.net"
    dns_zone_name  = "apps.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
    mode           = "Prevention"
    disabled_rules = {
      SQLI = [
        "942100",
        "942110",
        "942120",
        "942150",
        "942180",
        "942190",
        "942200",
        "942210",
        "942230",
        "942240",
        "942260",
        "942310",
        "942340",
        "942360",
        "942361",
        "942370",
        "942380",
        "942390",
        "942400",
        "942410",
        "942430",
        "942440",
        "942450"
      ],
      RCE = [
        "932100",
        "932105",
        "932110",
        "932115",
        "932150"
      ],
      LFI = [
        "930110"
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
              "20.26.11.71/32",
              "20.26.11.108/32",
              "20.49.214.199/32",
              "20.49.214.228/32",
              "20.58.23.145/32",
              "51.149.249.0/27",
              "51.149.249.32/27",
              "51.149.250.0/23",
              "128.77.75.64/26",
              "194.33.192.0/24",
              "194.33.196.0/24",
              "194.33.200.0/21",
              "194.33.216.0/23",
              "194.33.218.0/24",
              "194.33.248.0/24",
              "194.33.249.0/24",
              "195.59.75.0/24",
              #Prod Hubs
              "20.50.108.242/32",
              "20.50.109.148/32",
              #NonProd Hubs
              "20.49.168.141/32",
              "20.49.168.17/32"
            ]
          }
        ]
      }
    ]
  }
]

apim_appgw_exclusions = [
  {
    match_variable = "RequestArgNames"
    operator       = "Equals"
    selector       = "iss"
  }
]
