project               = "sdshmcts"
location              = "uksouth"
env                   = "test"
subscription          = "test"
oms_env               = "test"
private_ip_address    = "10.141.32.132"
be_private_ip_address = ["10.141.32.134"]
destinations          = ["10.141.15.250", "10.141.31.250"]
vnet_rg               = "ss-test-network-rg"
vnet_name             = "ss-test-vnet"
certificate_key_vault_name = "acmedtssdstest"
cdn_sku                    = "Standard_Verizon"
resource_group_name        = "sds-platform-test-rg"

frontends = [

  {
    name           = "toffee"
    custom_domain  = "toffee.test.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
    product        = "ss"
  }
]
