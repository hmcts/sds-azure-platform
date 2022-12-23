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
    name           = "c100-application"
    custom_domain  = "c100-application.staging.platform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]
    disabled_rules = {}
    health_path    = "/status"
    mode           = "Detection"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_c100_application_session"
      }
    ]
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
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "client_id"
      }
    ]
  },
  {
    name                = "pip-frontend-b2c-sign-in"
    custom_domain       = "sign-in.pip-frontend.staging.platform.hmcts.net"
    backend_domain      = ["hmctspipnonprod.b2clogin.com"]
    host_header         = "hmctspipnonprod.b2clogin.com"
    forwarding_protocol = "HttpsOnly"
    cache_enabled       = false
    shutter_app         = false
    disabled_rules      = {}
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
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "StartsWith"
        selector       = "x-ms-cpim-"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "diags"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "error_description"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "claim_value"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "ReadOnlyEmail"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "nonce"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      }
    ]
  },
  {
    name                = "pip-frontend-b2c-staff"
    custom_domain       = "staff.pip-frontend.staging.platform.hmcts.net"
    backend_domain      = ["hmctspipnonprod.b2clogin.com"]
    host_header         = "hmctspipnonprod.b2clogin.com"
    forwarding_protocol = "HttpsOnly"
    cache_enabled       = false
    shutter_app         = false
    disabled_rules      = {}
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
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "StartsWith"
        selector       = "x-ms-cpim-"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "diags"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "error_description"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "claim_value"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "ReadOnlyEmail"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "nonce"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      }
    ]
  },
  {
    name           = "vh-video-web"
    custom_domain  = "video.staging.hearings.reform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
  },
  {
    name           = "vh-admin-web"
    custom_domain  = "admin.staging.hearings.reform.hmcts.net"
    backend_domain = ["firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com"]

    disabled_rules = {}

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      }
    ]
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
  },
  {
    name                = "portal-stg"
    mode                = "Prevention"
    custom_domain       = "portal-stg.pre-recorded-evidence.justice.gov.uk"
    backend_domain      = ["pre-stg1.powerappsportals.com"]
    certificate_name    = "portal-stg-pre-recorded-evidence-justice-gov-uk"
    disabled_rules      = {}
    shutter_app         = false
    health_path         = "/SignIn?ReturnUrl=%2F"
    health_protocol     = "Https"
    forwarding_protocol = "HttpsOnly"
    cache_enabled       = "false"

    custom_rules = [
      {
        name     = "CountryMatchWhitelist"
        enabled  = true
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RemoteAddr"
            operator           = "GeoMatch"
            negation_condition = true
            match_values = [
              "GB"
            ]
          }
        ]
      }
    ]
  }
]
