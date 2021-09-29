locals {
  dns_zone_label_1 = var.env == "sbox" ? "sandbox" : var.env
  dns_zone_label   = var.env == "stg" ? "staging" : local.dns_zone_label_1
  dns_zone         = var.env == "prod" ? "platform.hmcts.net" : "${local.dns_zone_label}.platform.hmcts.net"

  gateways = yamldecode(data.local_file.configuration.content).gateways

  a_records = flatten([
    for gateways, gateway in local.gateways : [
      for app in gateway.app_configuration : {
        name   = "${app.product}-${app.component}",
        ttl    = 300,
        record = ["${gateway.gateway_configuration.private_ip_address}"]
      }
    ]
  ])
}

data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/${var.env}/backend_lb_config.yaml"
}

module "privatedns" {
  source              = "git::https://github.com/hmcts/azure-private-dns.git//modules/azure-private-dns?ref=master"
  a_recordsets        = local.a_records
  env                 = var.env
  resource_group_name = "core-infra-intsvc-rg"
  zone_name           = local.dns_zone
}
