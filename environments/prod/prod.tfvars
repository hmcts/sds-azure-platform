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

frontends = [
  {
    name           = "trib-land-reg-division"
    product        = "ss"
    mode           = "Prevention"
    custom_domain  = "landregistrationdivision.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]

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
    product        = "ss"
    mode           = "Prevention"
    custom_domain  = "immigrationservices.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]

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
    product        = "ss"
    mode           = "Prevention"
    custom_domain  = "informationrights.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]

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
    product        = "ss"
    mode           = "Prevention"
    custom_domain  = "administrativeappeals.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]

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
    product        = "ss"
    mode           = "Prevention"
    custom_domain  = "carestandards.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]

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
    product        = "ss"
    mode           = "Prevention"
    custom_domain  = "landschamber.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]

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
    product        = "ss"
    mode           = "Prevention"
    custom_domain  = "financeandtax.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]

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
    product        = "ss"
    mode           = "Prevention"
    custom_domain  = "employmentappeals.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]

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
    product        = "ss"
    mode           = "Prevention"
    custom_domain  = "transportappeals.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]

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
    product        = "ss"
    mode           = "Prevention"
    custom_domain  = "cicap.decisions.tribunals.gov.uk"
    backend_domain = ["34.243.192.28"]

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

    health_path    = "/"
    disabled_rules = {}
    product        = "ss"
  },

  {
    name             = "jd-reply-jury-summons"
    custom_domain    = "reply-jury-summons.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    ssl_mode         = "AzureKeyVault"
    certificate_name = "reply-jury-summons-service-gov-uk"

    health_path    = "/"
    disabled_rules = {}
    product        = "ss"
  }
]
