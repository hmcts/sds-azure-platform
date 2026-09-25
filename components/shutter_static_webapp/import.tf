import {
  for_each = var.env == "prod" ? ["opal-frontend"] : []

  to = module.static_webapp.azurerm_dns_txt_record.zone_validate["opal-frontend"]
  id = "/subscriptions/ed302caf-ec27-4c64-a05e-85731c3ce90e/resourceGroups/reformMgmtRG/providers/Microsoft.Network/dnsZones/apps.hmcts.net/TXT/_dnsauth.opal-frontend"
}