project                    = "sdshmcts"
location                   = "uksouth"
env                        = "test"
subscription               = "test"
certificate_key_vault_name = "dtssharedservicestestkv"
data_subscription          = "3eec5bde-7feb-4566-bfb6-805df6e10b90"
oms_env                    = "test"
key_vault_resource_group   = "genesis-rg"
subscription_id            = "3eec5bde-7feb-4566-bfb6-805df6e10b90"
frontends = [

  {
    name             = "toffee"
    custom_domain    = "toffee.test.platform.hmcts.net"
    backend_domain   = ["firewall-test-int-palo-sdstest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-test-platform-hmcts-net"
    disabled_rules   = {}
  }
]
