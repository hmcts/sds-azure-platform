project               = "sdshmcts"
location              = "uksouth"
env                   = "sbox"
subscription          = "sbox"
oms_env               = "sandbox"
private_ip_address    = "10.140.32.132"
be_private_ip_address = ["10.140.32.134"]
destinations          = ["10.140.15.250", "10.140.31.250"]
vnet_rg               = "ss-sbox-network-rg"
vnet_name             = "ss-sbox-vnet"

frontends = [
  {

    name           = "toffee"
    custom_domain  = "toffee.sandbox.platform.hmcts.net"
    backend_domain = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
    product        = "ss"

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
  }
]
