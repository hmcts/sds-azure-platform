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
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
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
    backend_domain   = ["firewall-nonprodi-palo-sdsapimgmttest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-test-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name                = "portal-test"
    mode                = "Prevention"
    custom_domain       = "portal-test.pre-recorded-evidence.justice.gov.uk"
    backend_domain      = ["pre-testing.powerappsportals.com"]
    certificate_name    = "portal-test-pre-recorded-evidence-justice-gov-uk"
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
