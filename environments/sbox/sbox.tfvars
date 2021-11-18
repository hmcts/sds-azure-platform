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

frontends = [
  {

    name             = "toffee"
    custom_domain    = "toffee.sandbox.platform.hmcts.net"
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    backend_domain   = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    disabled_rules   = {}

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
              "51.145.4.100/32"
            ]
          }
        ]
      },
    ],
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
    product          = "labs"
    name             = "mokainos"
    custom_domain    = "labs-mokainos.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sdsapimgmt.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
  }
]
