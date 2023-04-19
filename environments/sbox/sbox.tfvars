project            = "sdshmcts"
location           = "uksouth"
env                = "sbox"
subscription       = "sbox"
oms_env            = "sandbox"
private_ip_address = "10.140.32.132"
destinations       = ["10.140.15.250", "10.140.31.250"]
vnet_rg            = "ss-sbox-network-rg"
vnet_name          = "ss-sbox-vnet"
shutter_rg         = "sds-platform-sbox-rg"
cdn_sku            = "Standard_Verizon"
ssl_policy = {
  policy_type          = "Predefined"
  policy_name          = "AppGwSslPolicy20220101S"
  min_protocol_version = "TLSv1_2"
}

frontends = [
  {

    name             = "toffee"
    custom_domain    = "toffee.sandbox.platform.hmcts.net"
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    backend_domain   = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    disabled_rules   = {}
  },
  {
    product          = "sds-api-mgmt"
    name             = "sds-api-mgmt"
    custom_domain    = "sds-api-mgmt.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sdsapimgmt.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name             = "vh-test-web"
    custom_domain    = "vh-test-web.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    disabled_rules   = {}
    shutter_app      = false

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name             = "vh-video-web"
    custom_domain    = "vh-video-web.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    disabled_rules   = {}
    shutter_app      = false

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name             = "vh-admin-web"
    custom_domain    = "vh-admin-web.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    disabled_rules   = {}
    shutter_app      = false

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name                = "portal-sbox"
    mode                = "Prevention"
    custom_domain       = "portal-sbox.pre-recorded-evidence.justice.gov.uk"
    backend_domain      = ["pre-sbox.powerappsportals.com"]
    certificate_name    = "portal-sbox-pre-recorded-evidence-justice-gov-uk"
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
  },
  {
    name             = "darts-portal"
    custom_domain    = "darts-portal.sandbox.platform.hmcts.net"
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    backend_domain   = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    disabled_rules   = {}
  },
]