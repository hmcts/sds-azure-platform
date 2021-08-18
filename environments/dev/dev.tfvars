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

    mode           = "Prevention"
    health_path    = "/"
    disabled_rules = {
      JAVA = [
        "944250",
        "944240",
        "944210",
        "944200",
        "944130",
        "944120",
        "944110",
        "944100",
      ],
      FIX = [
        "943120",
        "943110",
        "943100",
      ],
      SQLI = [
        "942480",
        "942470",
        "942450",
        "942440",
        "942430",
        "942410",
        "942400",
        "942390",
        "942380",
        "942370",
        "942361",
        "942360",
        "942350",
        "942340",
        "942330",
        "942320",
        "942310",
        "942300",
        "942290",
        "942280",
        "942270",
        "942260",
        "942250",
        "942240",
        "942230",
        "942220",
        "942210",
        "942200",
        "942190",
        "942180",
        "942170",
        "942160",
        "942150",
        "942140",
        "942120",
        "942110",
        "942100",
      ],
      XSS = [
        "941350",
        "941340",
        "941330",
        "941320",
        "941310",
        "941300",
        "941290",
        "941280",
        "941270",
        "941260",
        "941250",
        "941240",
        "941230",
        "941220",
        "941210",
        "941200",
        "941190",
        "941180",
        "941170",
        "941160",
        "941150",
        "941140",
        "941130",
        "941120",
        "941110",
        "941101",
        "941100",
      ],
      PHP = [
        "933180",
        "933170",
        "933160",
        "933151",
        "933150",
        "933140",
        "933130",
        "933120",
        "933110",
        "933100",
      ],
      RCE = [
        "932180",
        "932171",
        "932170",
        "932160",
        "932150",
        "932140",
        "932130",
        "932120",
        "932115",
        "932110",
        "932105",
        "932100",
      ],
      RFI = [
        "931130",
        "931120",
        "931110",
        "931100",
      ],
      LFI = [
        "930130",
        "930120",
        "930110",
        "930100",
      ],
      PROTOCOL-ATTACK = [
        "921151",
        "921160",
        "921150",
        "921140",
        "921130",
        "921120",
        "921110",
      ],
    }
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

    mode           = "Detection"
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
