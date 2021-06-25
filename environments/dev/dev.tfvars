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
  }
]

traffic_manager_endpoints = {
  fw-uksouth-nonprodi-palo-mailrelay0-pip = { profile_name = "ss-dev-mailrelay-tm", resource_group_name = "ss-dev-network-rg", target_resource_id = "/subscriptions/fb084706-583f-4c9a-bdab-949aac66ba5c/resourceGroups/hmcts-hub-nonprodi/providers/Microsoft.Network/publicIPAddresses/fw-uksouth-nonprodi-palo-mailrelay0-pip", type = "azureEndpoints", weight = "50"},
  fw-uksouth-nonprodi-palo-mailrelay1-pip = { profile_name = "ss-dev-mailrelay-tm", resource_group_name = "ss-dev-network-rg", target_resource_id = "/subscriptions/fb084706-583f-4c9a-bdab-949aac66ba5c/resourceGroups/hmcts-hub-nonprodi/providers/Microsoft.Network/publicIPAddresses/fw-uksouth-nonprodi-palo-mailrelay1-pip", type = "azureEndpoints", weight = "50"}
}

traffic_manager_profiles = {
  ss-dev-mailrelay-tm = { protocol = "tcp", port = "587", relative_name = "ss-dev-mailrelay", resource_group_name = "ss-dev-network-rg", traffic_routing_method = "weighted", ttl = "180"}
}
