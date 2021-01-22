project                    = "sdshmcts"
location                   = "uksouth"
env                        = "ithc"
subscription               = "ithc"
certificate_key_vault_name = "dtssharedservicesithckv"
oms_env                    = "ithc"
key_vault_resource_group   = "genesis-rg"
private_ip_address         = "10.143.32.132"
destinations               = ["10.143.15.250","10.143.31.250"]
vnet_rg                    = "ss-ithc-network-rg"
vnet_name                  = "ss-ithc-vnet"
vault_name                 = ""
frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    disabled_rules   = {}
    product          = "ss"
  }
]
