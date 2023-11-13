project            = "sdshmcts"
location           = "uksouth"
env                = "demo"
subscription       = "demo"
oms_env            = "demo"
private_ip_address = "10.51.96.133"
destinations       = ["10.51.79.250", "10.51.95.250"]
vnet_rg            = "ss-demo-network-rg"
vnet_name          = "ss-demo-vnet"
hub                = "nonprod"
autoShutdown       = true
ssl_policy = {
  policy_type          = "Predefined"
  policy_name          = "AppGwSslPolicy20220101S"
  min_protocol_version = "TLSv1_2"
}

key_vault_subscription        = "c68a4bed-4c3d-4956-af51-4ae164c1957c"
hub_app_gw_private_ip_address = ["10.11.72.230"]
apim_appgw_backend_pool_fqdns = ["firewall-nonprodi-palo-sdsapimgmtdemo.uksouth.cloudapp.azure.com"]
apim_appgw_min_capacity       = 1
apim_appgw_max_capacity       = 2

frontends = [
  {
    name             = "sds-api-mgmt"
    custom_domain    = "sds-api-mgmt.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsapimgmtdemo.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name                = "portal-demo"
    mode                = "Prevention"
    custom_domain       = "portal-demo.pre-recorded-evidence.justice.gov.uk"
    backend_domain      = ["pre-demo.powerappsportals.com"]
    certificate_name    = "portal-demo-pre-recorded-evidence-justice-gov-uk"
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
    product          = "toffee"
    name             = "toffee"
    custom_domain    = "toffee.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
  },
  {
    product          = "pip"
    name             = "pip-frontend"
    custom_domain    = "pip-frontend.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsdemoappgateway.uksouth.cloudapp.azure.com"]
    redirect_url     = "https://pip-frontend.demo.platform.hmcts.net/unprocessed-request"
    certificate_name = "wildcard-demo-platform-hmcts-net"

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
    ]
  },
  {
    name                = "pip-frontend-b2c-sign-in"
    custom_domain       = "sign-in.pip-frontend.demo.platform.hmcts.net"
    dns_zone_name       = "demo.platform.hmcts.net"
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
    custom_domain       = "staff.pip-frontend.demo.platform.hmcts.net"
    dns_zone_name       = "demo.platform.hmcts.net"
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
    product          = "c100"
    name             = "c100-application"
    custom_domain    = "c100-application.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
  },
  {
    product          = "vh"
    name             = "vh-admin-web"
    custom_domain    = "vh-admin-web.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"

    disabled_rules = {
      SQLI = [
        "942430",
        "942440",
      ],
    }
  },
  {
    product          = "vh"
    name             = "vh-test-web"
    custom_domain    = "vh-test-web.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"

    disabled_rules = {
      SQLI = [
        "942430",
        "942440",
      ],
    }
  },
  {
    product          = "vh"
    name             = "vh-video-web"
    custom_domain    = "vh-video-web.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"

    disabled_rules = {
      SQLI = [
        "942430",
        "942440",
      ],
    }

  },
  {
    product          = "pre"
    name             = "pre-portal"
    custom_domain    = "pre-portal.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
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
    product          = "darts-portal"
    name             = "darts-portal"
    custom_domain    = "darts-portal.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"

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
        selector       = "connect.sid"
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
