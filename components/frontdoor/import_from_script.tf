import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_profile.front_door
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_endpoint.endpoint
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.defaultBackend
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/defaultBackend"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.default_routing_rule
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/defaultRouting"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["dts-legacy-apps---certificatedbailiffs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[0].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["dts-legacy-apps---certificatedbailiffs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[0].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["dts-legacy-apps---certificatedbailiffs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[0].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["dts-legacy-apps---certificatedbailiffs"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[0].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["dts-legacy-apps---certificatedbailiffs"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[0].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["dts-legacy-apps---certificatedbailiffs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[0].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["dts-legacy-apps---civilappeals-casetracker"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[1].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["dts-legacy-apps---civilappeals-casetracker"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[1].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["dts-legacy-apps---civilappeals-casetracker"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[1].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["dts-legacy-apps---civilappeals-casetracker"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[1].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["dts-legacy-apps---civilappeals-casetracker"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[1].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["dts-legacy-apps---civilappeals-casetracker"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[1].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["dts-legacy-apps---courtfines"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[2].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["dts-legacy-apps---courtfines"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[2].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["dts-legacy-apps---courtfines"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[2].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["dts-legacy-apps---courtfines"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[2].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["dts-legacy-apps---courtfines"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[2].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["dts-legacy-apps---courtfines"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[2].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["dts-legacy-apps---immigration-appeals-iacfees"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[3].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["dts-legacy-apps---immigration-appeals-iacfees"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[3].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["dts-legacy-apps---immigration-appeals-iacfees"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[3].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["dts-legacy-apps---immigration-appeals-iacfees"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[3].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["dts-legacy-apps---immigration-appeals-iacfees"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[3].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["dts-legacy-apps---immigration-appeals-iacfees"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[3].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["dts-legacy-apps---redirect-service"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[4].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["dts-legacy-apps---redirect-service"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[4].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["dts-legacy-apps---redirect-service"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[4].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["dts-legacy-apps---redirect-service"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[4].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["dts-legacy-apps---redirect-service"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[4].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["dts-legacy-apps---redirect-service"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[4].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["dts-legacy-apps---utiac"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[5].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["dts-legacy-apps---utiac"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[5].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["dts-legacy-apps---utiac"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[5].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["dts-legacy-apps---utiac"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[5].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["dts-legacy-apps---utiac"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[5].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["dts-legacy-apps---utiac"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[5].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["casetracker"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[6].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["casetracker"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[6].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["casetracker"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[6].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["casetracker"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[6].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["casetracker"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[6].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["casetracker"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[6].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["certificatedbailiffs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[7].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["certificatedbailiffs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[7].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["certificatedbailiffs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[7].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["certificatedbailiffs"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[7].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["certificatedbailiffs"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[7].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["certificatedbailiffs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[7].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["courtfines"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[8].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["courtfines"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[8].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["courtfines"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[8].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["courtfines"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[8].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["courtfines"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[8].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["courtfines"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[8].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["immigrationappealsonline"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[9].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["immigrationappealsonline"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[9].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["immigrationappealsonline"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[9].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["immigrationappealsonline"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[9].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["immigrationappealsonline"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[9].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["immigrationappealsonline"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[9].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["tribunalsdecisions"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[10].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["tribunalsdecisions"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[10].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["tribunalsdecisions"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[10].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["tribunalsdecisions"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[10].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["tribunalsdecisions"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[10].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["tribunalsdecisions"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[10].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["trib-land-reg-division"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[11].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["trib-land-reg-division"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[11].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["trib-land-reg-division"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[11].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["trib-land-reg-division"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[11].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["trib-land-reg-division"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[11].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["trib-land-reg-division"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[11].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["trib-immigration-svcs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[12].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["trib-immigration-svcs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[12].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["trib-immigration-svcs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[12].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["trib-immigration-svcs"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[12].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["trib-immigration-svcs"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[12].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["trib-immigration-svcs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[12].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["trib-info-rights"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[13].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["trib-info-rights"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[13].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["trib-info-rights"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[13].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["trib-info-rights"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[13].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["trib-info-rights"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[13].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["trib-info-rights"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[13].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["trib-admin-appeals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[14].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["trib-admin-appeals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[14].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["trib-admin-appeals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[14].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["trib-admin-appeals"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[14].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["trib-admin-appeals"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[14].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["trib-admin-appeals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[14].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["trib-care-standards"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[15].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["trib-care-standards"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[15].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["trib-care-standards"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[15].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["trib-care-standards"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[15].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["trib-care-standards"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[15].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["trib-care-standards"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[15].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["trib-lands-chamber"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[16].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["trib-lands-chamber"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[16].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["trib-lands-chamber"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[16].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["trib-lands-chamber"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[16].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["trib-lands-chamber"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[16].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["trib-lands-chamber"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[16].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["trib-finance-tax"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[17].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["trib-finance-tax"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[17].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["trib-finance-tax"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[17].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["trib-finance-tax"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[17].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["trib-finance-tax"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[17].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["trib-finance-tax"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[17].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["trib-employment-appeals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[18].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["trib-employment-appeals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[18].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["trib-employment-appeals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[18].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["trib-employment-appeals"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[18].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["trib-employment-appeals"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[18].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["trib-employment-appeals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[18].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["trib-tansport-appeals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[19].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["trib-tansport-appeals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[19].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["trib-tansport-appeals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[19].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["trib-tansport-appeals"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[19].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["trib-tansport-appeals"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[19].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["trib-tansport-appeals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[19].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["trib-cicap"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[20].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["trib-cicap"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[20].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["trib-cicap"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[20].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["trib-cicap"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[20].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["trib-cicap"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[20].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["trib-cicap"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[20].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["jd-bureau"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[21].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["jd-bureau"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[21].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["jd-bureau"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[21].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["jd-bureau"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[21].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["jd-bureau"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[21].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["jd-bureau"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[21].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["jd-reply-jury-summons"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[22].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["jd-reply-jury-summons"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[22].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["jd-reply-jury-summons"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[22].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["jd-reply-jury-summons"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[22].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["jd-reply-jury-summons"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[22].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["jd-reply-jury-summons"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[22].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["court-tribunal-hearings"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[23].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["court-tribunal-hearings"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[23].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["court-tribunal-hearings"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[23].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["court-tribunal-hearings"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[23].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["court-tribunal-hearings"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[23].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["court-tribunal-hearings"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[23].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["court-tribunal-hearings-b2c-sign-in"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[24].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["court-tribunal-hearings-b2c-sign-in"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[24].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["court-tribunal-hearings-b2c-sign-in"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[24].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["court-tribunal-hearings-b2c-sign-in"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[24].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["court-tribunal-hearings-b2c-sign-in"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[24].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["court-tribunal-hearings-b2c-sign-in"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[24].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["court-tribunal-hearings-b2c-staff"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[25].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["court-tribunal-hearings-b2c-staff"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[25].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["court-tribunal-hearings-b2c-staff"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[25].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["court-tribunal-hearings-b2c-staff"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[25].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["court-tribunal-hearings-b2c-staff"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[25].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["court-tribunal-hearings-b2c-staff"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[25].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["vh-video-web"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[26].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["vh-video-web"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[26].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["vh-video-web"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[26].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["vh-video-web"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[26].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["vh-video-web"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[26].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["vh-video-web"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[26].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["vh-admin-web"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[27].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["vh-admin-web"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[27].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["vh-admin-web"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[27].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["vh-admin-web"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[27].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["vh-admin-web"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[27].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["vh-admin-web"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[27].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["toffee"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[28].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["toffee"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[28].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["toffee"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[28].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["toffee"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[28].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["toffee"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[28].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["toffee"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[28].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["netbox"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[29].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["netbox"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[29].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["netbox"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[29].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["netbox"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[29].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["netbox"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[29].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["netbox"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[29].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["pre-portal"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[30].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["pre-portal"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[30].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["pre-portal"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[30].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["pre-portal"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[30].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["pre-portal"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[30].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["pre-portal"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[30].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["sds-api-mgmt"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[31].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["sds-api-mgmt"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[31].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["sds-api-mgmt"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[31].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["sds-api-mgmt"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[31].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["sds-api-mgmt"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[31].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["sds-api-mgmt"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[31].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["c100-application"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[32].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["c100-application"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[32].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["c100-application"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[32].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["c100-application"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[32].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["c100-application"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[32].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["c100-application"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[32].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["portal"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[33].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["portal"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[33].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["portal"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[33].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["portal"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[33].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["portal"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[33].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["portal"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[33].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["ejudiciary-home"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[34].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["ejudiciary-home"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[34].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["ejudiciary-home"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[34].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["ejudiciary-home"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[34].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["ejudiciary-home"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[34].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["ejudiciary-home"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[34].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["ejudiciary-home-apex"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[35].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["ejudiciary-home-apex"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[35].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["ejudiciary-home-apex"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[35].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["ejudiciary-home-apex"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[35].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["ejudiciary-home-apex"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[35].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["ejudiciary-home-apex"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[35].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["ejudiciary-home-www"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[36].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["ejudiciary-home-www"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[36].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["ejudiciary-home-www"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[36].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["ejudiciary-home-www"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[36].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["ejudiciary-home-www"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[36].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["ejudiciary-home-www"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[36].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["sds-sandbox-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[37].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["sds-sandbox-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[37].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["sds-sandbox-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[37].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["sds-sandbox-build"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[37].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["sds-sandbox-build"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[37].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["sds-sandbox-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[37].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["static-sds-sandbox-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[38].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["static-sds-sandbox-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[38].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["static-sds-sandbox-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[38].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["static-sds-sandbox-build"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[38].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["static-sds-sandbox-build"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[38].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["static-sds-sandbox-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[38].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["sds-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[39].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["sds-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[39].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["sds-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[39].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["sds-build"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[39].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["sds-build"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[39].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["sds-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.fd_rg.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[39].name, "-", "")}${var.env}Premium-securityPolicy"
}
