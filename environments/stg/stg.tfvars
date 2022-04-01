project            = "sdshmcts"
location           = "uksouth"
env                = "stg"
subscription       = "stg"
oms_env            = "stg"
private_ip_address = "10.148.32.132"
destinations       = ["10.148.15.250", "10.148.31.250"]
vnet_rg            = "ss-stg-network-rg"
vnet_name          = "ss-stg-vnet"
hub                = "prod"

frontends = [

  {
    name           = "toffee"
    custom_domain  = "toffee.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "pip-frontend"
    custom_domain  = "pip-frontend.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
    
    global_exclusions = [
      ## Open ID response parameters
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "state"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "formCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      }
    ]
  },
  {
    name           = "vh-test-web"
    custom_domain  = "vh-test-web.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-video-web"
    custom_domain  = "vh-video-web.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-admin-web"
    custom_domain  = "vh-admin-web.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "vh-service-web"
    custom_domain  = "vh-service-web.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}
  },
  {
    name           = "staging-casetracker"
    custom_domain  = "staging.casetracker.justice.gov.uk"
    backend_domain = ["dualstack.civil-loadb-105un4gbv5077-2040046462.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = true
  },
  {
    name           = "staging-certificatedbailiffs"
    custom_domain  = "staging.certificatedbailiffs.justice.gov.uk"
    backend_domain = ["dualstack.certi-loadb-vzujs6ulbuut-415542592.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = true
    session_affinity = true
  },
  {
    name           = "staging-courtfines"
    custom_domain  = "staging.courtfines.direct.gov.uk"
    backend_domain = ["dualstack.court-loadb-qpahtenf925i-482204730.eu-west-2.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = true
  },
  {
    name           = "staging-immigrationappealsonline"
    custom_domain  = "staging.immigrationappealsonline.justice.gov.uk"
    backend_domain = ["dualstack.iacfees-s-ELBhmcts-DGD2EJ56UXEF-715536071.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = true
  },
  {
    name             = "sds-api-mgmt"
    custom_domain    = "sds-api-mgmt.staging.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-sdsapimgmtstg.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-stg-platform-hmcts-net"
    cache_enabled    = "false"
  }
]
