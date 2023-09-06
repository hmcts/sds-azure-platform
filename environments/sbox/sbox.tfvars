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
sku_tier           = "Free"
sku_size           = "Free"
autoShutdown       = true
ssl_policy = {
  policy_type          = "Predefined"
  policy_name          = "AppGwSslPolicy20220101S"
  min_protocol_version = "TLSv1_2"
}

key_vault_subscription        = "a8140a9e-f1b0-481f-a4de-09e2ee23f7ab"
hub_app_gw_private_ip_address = ["10.10.200.222"]
apim_appgw_backend_pool_fqdns = ["firewall-sbox-int-palo-sdsapimgmt.uksouth.cloudapp.azure.com"]

frontends = [
  {

    name             = "toffee"
    shutter_app      = true
    dns_zone_name    = "sandbox.platform.hmcts.net"
    custom_domain    = "toffee.sandbox.platform.hmcts.net"
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    backend_domain   = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    disabled_rules   = {}
  },
  {
    product          = "sds-api-mgmt"
    name             = "sds-api-mgmt"
    shutter_app      = false
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
    name             = "vh-video-web"
    custom_domain    = "vh-video-web.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    disabled_rules   = {}
    shutter_app      = false
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
    name             = "vh-admin-web"
    custom_domain    = "vh-admin-web.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    disabled_rules   = {}
    shutter_app      = false
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
    name                = "portal-sbox"
    mode                = "Prevention"
    custom_domain       = "portal-sbox.pre-recorded-evidence.justice.gov.uk"
    backend_domain      = ["pre-sbox.powerappsportals.com"]
    certificate_name    = "portal-sbox-pre-recorded-evidence-justice-gov-uk"
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
    name                = "pre-portal"
    mode                = "Prevention"
    custom_domain       = "pre-portal.sbox.platform.hmcts.net"
    backend_domain      = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    certificate_name    = "wildcard-sandbox-platform-hmcts-net"
    shutter_app         = false
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
    name             = "darts-portal"
    custom_domain    = "darts-portal.sandbox.platform.hmcts.net"
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    backend_domain   = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    disabled_rules   = {}
    shutter_app      = false

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
