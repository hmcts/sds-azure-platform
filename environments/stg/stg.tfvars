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
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "court-and-tribunal-hearings-cookie-preferences"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "createAdminAccount"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "error_description"
      },
    ]
  },
  /*  {
    name                = "pip-frontend-b2c-sign-in"
    custom_domain       = "sign.stg.court-tribunal-hearings.service.gov.uk"
    backend_domain      = ["hmctspipprod.b2clogin.com"]
    host_header         = "hmctspipprod.b2clogin.com"
    disabled_rules      = {}
    cache_enabled       = false
    forwarding_protocol = "HttpsOnly"
    ssl_mode            = "FrontDoor"
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "desc"
      }
    ]
  }, */
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
  },
  {
    name           = "staging-trib-land-reg-division"
    mode           = "Prevention"
    custom_domain  = "staging.landregistrationdivision.dsd.io"
    backend_domain = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

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
    name           = "staging-trib-immigration-svcs"
    mode           = "Prevention"
    custom_domain  = "staging.immigrationservices.dsd.io"
    backend_domain = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name           = "staging-trib-info-rights"
    mode           = "Prevention"
    custom_domain  = "staging.informationrights.dsd.io"
    backend_domain = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

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
    name           = "staging-trib-admin-appeals"
    mode           = "Prevention"
    custom_domain  = "staging.administrativeappeals.dsd.io"
    backend_domain = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

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
    name           = "staging-trib-care-standards"
    mode           = "Prevention"
    custom_domain  = "staging.carestandards.dsd.io"
    backend_domain = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

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
    name           = "staging-trib-lands-chamber"
    mode           = "Prevention"
    custom_domain  = "staging.landschamber.dsd.io"
    backend_domain = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name           = "staging-trib-finance-tax"
    mode           = "Prevention"
    custom_domain  = "staging.financeandtax.dsd.io"
    backend_domain = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    disabled_rules = {
      SQLI = [
        "942430", // false positive on /Admin/Commissioners.aspx
      ]
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
    name           = "staging-trib-employment-appeals"
    mode           = "Prevention"
    custom_domain  = "staging.employmentappeals.dsd.io"
    backend_domain = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
  },
  {
    name           = "staging-trib-tansport-appeals"
    mode           = "Prevention"
    custom_domain  = "staging.transportappeals.dsd.io"
    backend_domain = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name           = "staging-trib-cicap"
    mode           = "Prevention"
    custom_domain  = "staging.cicap.dsd.io"
    backend_domain = ["dts-trib-staging-556942830.eu-west-1.elb.amazonaws.com"]
    shutter_app    = false
    enable_ssl     = false

    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
  }
]