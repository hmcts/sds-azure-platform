project               = "sdshmcts"
location              = "uksouth"
env                   = "prod"
subscription          = "prod"
oms_env               = "prod"
private_ip_address    = "10.144.32.132"
be_private_ip_address = ["10.144.32.136"]
destinations          = ["10.144.15.250", "10.144.31.250"]
vnet_rg               = "ss-prod-network-rg"
vnet_name             = "ss-prod-vnet"
shutter_rg            = "sds-platform-prod-rg"
cdn_sku               = "Standard_Verizon"

frontends = [
  {
    name           = "trib-land-reg-division"
    mode           = "Prevention"
    custom_domain  = "landregistrationdivision.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]
    shutter_app    = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "ddlScat1"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__EVENTVALIDATION"
      }
    ]
  },
  {
    name           = "trib-immigration-svcs"
    mode           = "Prevention"
    custom_domain  = "immigrationservices.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]
    shutter_app    = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name           = "trib-info-rights"
    mode           = "Prevention"
    custom_domain  = "informationrights.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]
    shutter_app    = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__EVENTVALIDATION"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "ddlTax3"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "ddlTax2"
      }
    ]
  },
  {
    name           = "trib-admin-appeals"
    mode           = "Prevention"
    custom_domain  = "administrativeappeals.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]
    shutter_app    = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name           = "trib-care-standards"
    mode           = "Prevention"
    custom_domain  = "carestandards.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]
    shutter_app    = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__EVENTVALIDATION"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "drpMainCategory"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "InitialBodyContents"
      }
    ]
  },
  {
    name           = "trib-lands-chamber"
    mode           = "Prevention"
    custom_domain  = "landschamber.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]
    shutter_app    = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name           = "trib-finance-tax"
    mode           = "Prevention"
    custom_domain  = "financeandtax.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]
    shutter_app    = false

    disabled_rules = {
      SQLI = []
      LFI = [
        "930110", // false positive on multi-part uploads
      ]
    }
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "InitialBodyContents"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "txtClaimant"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
  },
  {
    name           = "trib-employment-appeals"
    mode           = "Prevention"
    custom_domain  = "employmentappeals.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]
    shutter_app    = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
  },
  {
    name           = "trib-tansport-appeals"
    mode           = "Prevention"
    custom_domain  = "transportappeals.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]
    shutter_app    = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name           = "trib-cicap"
    mode           = "Prevention"
    custom_domain  = "cicap.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]
    shutter_app    = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
  },
  {
    name             = "jd-bureau"
    custom_domain    = "juror-bureau.justice.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    ssl_mode         = "AzureKeyVault"
    certificate_name = "juror-bureau-justice-gov-uk"

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
              "51.145.4.100/32",
              "185.125.224.42",
              "62.254.63.52",
            ]
          }
        ]
      },
    ],
  },

  {
    name             = "jd-reply-jury-summons"
    custom_domain    = "reply-jury-summons.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    ssl_mode         = "AzureKeyVault"
    certificate_name = "reply-jury-summons-service-gov-uk"

    mode           = "Detection"
    health_path    = "/"
    disabled_rules = {}
  }
]

traffic_manager_endpoints = {
  fw-uksouth-prod-int-palo-mailrelay0-pip = { profile_name = "ss-prod-mailrelay-tm", resource_group_name = "ss-prod-network-rg", target_resource_id = "/subscriptions/0978315c-75fe-4ada-9d11-1eb5e0e0b214/resourceGroups/hmcts-hub-prod-int/providers/Microsoft.Network/publicIPAddresses/fw-uksouth-prod-int-palo-mailrelay0-pip", type = "azureEndpoints", weight = "50" },
  fw-uksouth-prod-int-palo-mailrelay1-pip = { profile_name = "ss-prod-mailrelay-tm", resource_group_name = "ss-prod-network-rg", target_resource_id = "/subscriptions/0978315c-75fe-4ada-9d11-1eb5e0e0b214/resourceGroups/hmcts-hub-prod-int/providers/Microsoft.Network/publicIPAddresses/fw-uksouth-prod-int-palo-mailrelay1-pip", type = "azureEndpoints", weight = "50" }
}

traffic_manager_profiles = {
  ss-prod-mailrelay-tm = { protocol = "TCP", port = "587", relative_name = "ss-prod-mailrelay", resource_group_name = "ss-prod-network-rg", traffic_routing_method = "Weighted", ttl = "180" }
}
