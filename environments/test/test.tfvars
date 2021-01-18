project                    = "sdshmcts"
location                   = "uksouth"
env                        = "test"
subscription               = "test"
certificate_key_vault_name = "dtssharedservicestestkv"
oms_env                    = "test"
key_vault_resource_group   = "genesis-rg"
private_ip_address         = "10.141.32.132"
destinations               = ["10.141.15.250","10.141.31.250"]
vnet_rg                    = "ss-test-network-rg"
vnet_name                  = "ss-test-vnet"
vault_name                 = ""
frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.test.platform.hmcts.net"
    backend_domain   = ["firewall-test-int-palo-sdstest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-test-platform-hmcts-net"
    disabled_rules   = {}
    product          = "ss"
  }
]
