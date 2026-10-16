import {
  for_each = var.env == "prod" ? toset(["opal-frontend"]) : toset([])
  to       = module.static_webapp.azurerm_dns_txt_record.zone_validate[each.value]
  id       = "/subscriptions/ed302caf-ec27-4c64-a05e-85731c3ce90e/resourceGroups/reformMgmtRG/providers/Microsoft.Network/dnsZones/apps.hmcts.net/TXT/_dnsauth.${each.value}"
}
