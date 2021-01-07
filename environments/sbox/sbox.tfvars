project                    = "sdshmcts"
location                   = "uksouth"
env                        = "sbox"
subscription               = "sbox"
oms_env                    = "sandbox"
private_ip_address         = "10.140.32.132"
destinations               = ["10.140.15.250", "10.140.31.250"]
vnet_rg                    = "ss-sbox-network-rg"
vnet_name                  = "ss-sbox-vnet"
key_vault_resource_group   = "genesis-rg"
certificate_key_vault_name = "dtssharedservicessboxkv"
vault_name                 = ""

frontends = [
  {

    name             = "toffee"
    custom_domain    = "toffee.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com"]
    certificate_name = "STAR-sandbox-platform-hmcts-net"
    disabled_rules   = {}
    product          = "ss"
  }
]
data_subscription = "a8140a9e-f1b0-481f-a4de-09e2ee23f7ab"

