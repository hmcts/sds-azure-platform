project                    = "sdshmcts"
location                   = "uksouth"
env                        = "sbox"
subscription               = "sbox"
oms_env                    = "sandbox"
private_ip_address         = "10.140.32.132"
destinations               = ["10.140.15.250", "10.140.31.250"]
// ss_apps_cluster_ips        = ["10.140.0.0/20", "10.140.16.0/20"]
vnet_rg                    = "ss-sbox-network-rg"
vnet_name                  = "ss-sbox-vnet"
key_vault_resource_group   = "genesis-rg"
certificate_key_vault_name = "dtssharedservicessboxkv"
vault_name                 = "dtssharedservicessboxkv"
#backend_cert_kv_sub_id     = "b72ab7b7-723f-4b18-b6f6-03b0f2c6a1bb"

frontends = [
  {

    name             = "toffee"
    custom_domain    = "toffee.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    certificate_name = "STAR-sandbox-platform-hmcts-net"
    disabled_rules   = {}
    product          = "ss"
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

