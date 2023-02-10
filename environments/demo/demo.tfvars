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
    custom_domain    = "plum-public.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
  }
]
