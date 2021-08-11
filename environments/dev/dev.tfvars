project               = "sdshmcts"
location              = "uksouth"
env                   = "dev"
subscription          = "dev"
oms_env               = "dev"
private_ip_address    = "10.145.32.132"
be_private_ip_address = ["10.145.32.134"]
destinations          = ["10.145.15.250"]
vnet_rg               = "ss-dev-network-rg"
vnet_name             = "ss-dev-vnet"

frontends = [

  {
    name           = "toffee"
    custom_domain  = "toffee.dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
    product        = "ss"
  },

  {
    name           = "jd-bureau"
    custom_domain  = "jdbureau.dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]

    health_path    = "/"
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
              "81.134.202.29/32",
              "51.145.6.230/32",
              "194.33.192.0/25",
              "194.33.196.0/25",
              "195.59.75.0/24",
              "158.234.251.0/24",
              "158.234.250.0/24",
              "213.121.161.124/32",
              "51.145.4.100/32"
            ]
          }
        ]
      },
    ],
  },

  {
    name           = "jd-public"
    custom_domain  = "jdfrontend.dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com"]

    health_path    = "/"
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
              "81.134.202.29/32",
              "51.145.6.230/32",
              "194.33.192.0/25",
              "194.33.196.0/25",
              "195.59.75.0/24",
              "158.234.251.0/24",
              "158.234.250.0/24",
              "213.121.161.124/32",
              "51.145.4.100/32"
            ]
          }
        ]
      },
    ],
  }
]

traffic_manager_endpoints = {
  fw-uksouth-nonprodi-palo-mailrelay0-pip = { profile_name = "ss-dev-mailrelay-tm", resource_group_name = "ss-dev-network-rg", target_resource_id = "/subscriptions/fb084706-583f-4c9a-bdab-949aac66ba5c/resourceGroups/hmcts-hub-nonprodi/providers/Microsoft.Network/publicIPAddresses/fw-uksouth-nonprodi-palo-mailrelay0-pip", type = "azureEndpoints", weight = "50" },
  fw-uksouth-nonprodi-palo-mailrelay1-pip = { profile_name = "ss-dev-mailrelay-tm", resource_group_name = "ss-dev-network-rg", target_resource_id = "/subscriptions/fb084706-583f-4c9a-bdab-949aac66ba5c/resourceGroups/hmcts-hub-nonprodi/providers/Microsoft.Network/publicIPAddresses/fw-uksouth-nonprodi-palo-mailrelay1-pip", type = "azureEndpoints", weight = "50" }
}

traffic_manager_profiles = {
  ss-dev-mailrelay-tm = { protocol = "TCP", port = "587", relative_name = "ss-dev-mailrelay", resource_group_name = "ss-dev-network-rg", traffic_routing_method = "Weighted", ttl = "180" }
}
