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
    name                  = "toffee"
    custom_domain         = "toffee.test.platform.hmcts.net"
    backend_domain        = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
    shutter_name_override = "false"
    disabled_rules        = {}
  },

  {
    name                  = "pip-frontend"
    custom_domain         = "pip-frontend.test.platform.hmcts.net"
    backend_domain        = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
    shutter_name_override = "false"

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
        action   = "Block"

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
        action   = "Block"

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
        action   = "Block"

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
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "court-and-tribunal-hearings-cookie-preferences"
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
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "createAdminAccount"
      }
    ]
  },
  {
    name                  = "vh-test-web"
    custom_domain         = "vh-test-web.test.platform.hmcts.net"
    backend_domain        = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
    cache_enabled         = "false"
    shutter_name_override = "false"

    disabled_rules = {}
  },
  {
    name                  = "vh-video-web"
    custom_domain         = "vh-video-web.test.platform.hmcts.net"
    backend_domain        = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
    cache_enabled         = "false"
    shutter_name_override = "false"

    disabled_rules = {}
  },
  {
    name                  = "vh-admin-web"
    custom_domain         = "vh-admin-web.test.platform.hmcts.net"
    backend_domain        = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]
    cache_enabled         = "false"
    shutter_name_override = "false"

    disabled_rules = {}
  },
  {
    name                  = "sds-api-mgmt"
    custom_domain         = "sds-api-mgmt.test.platform.hmcts.net"
    backend_domain        = ["firewall-nonprodi-palo-sdsapimgmttest.uksouth.cloudapp.azure.com"]
    certificate_name      = "wildcard-test-platform-hmcts-net"
    cache_enabled         = "false"
    shutter_name_override = "false"
  },
  {
    name                  = "portal-test"
    mode                  = "Prevention"
    custom_domain         = "portal-test.pre-recorded-evidence.justice.gov.uk"
    backend_domain        = ["pre-testing.powerappsportals.com"]
    certificate_name      = "portal-test-pre-recorded-evidence-justice-gov-uk"
    disabled_rules        = {}
    shutter_app           = false
    health_path           = "/SignIn?ReturnUrl=%2F"
    health_protocol       = "Https"
    forwarding_protocol   = "HttpsOnly"
    cache_enabled         = "false"
    shutter_name_override = "false"

    disabled_rules = {
      SQLI = [
        "942440",
        "942450",
      ],
      RCE = [
        "932100",
        "932110",
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
  }
]

apim_appgw_exclusions = [
  {
    match_variable = "RequestArgNames"
    operator       = "Equals"
    selector       = "iss"
  }
]
