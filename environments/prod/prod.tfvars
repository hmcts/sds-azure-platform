project                    = "sdshmcts"
location                   = "uksouth"
env                        = "prod"
subscription               = "prod"
certificate_key_vault_name = "dtssharedservicesprodkv"
data_subscription          = "5ca62022-6aa2-4cee-aaa7-e7536c8d566c"
oms_env                    = "prod"
key_vault_resource_group   = "genesis-rg"
subscription_id            = "5ca62022-6aa2-4cee-aaa7-e7536c8d566c"
frontends = [
  {
    name             = "trib-land-reg-division"
    mode             = "Prevention"
    custom_domain    = "landregistrationdivision.decisions.tribunals.gov.uk"
    backend_domain   = ["34.243.192.28"]
    certificate_name = "decisions-tribunals-gov-uk"
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
    name             = "trib-immigration-svcs"
    mode             = "Prevention"
    custom_domain    = "immigrationservices.decisions.tribunals.gov.uk"
    backend_domain   = ["34.243.192.28"]
    certificate_name = "decisions-tribunals-gov-uk"
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name             = "trib-info-rights"
    mode             = "Prevention"
    custom_domain    = "informationrights.decisions.tribunals.gov.uk"
    backend_domain   = ["34.243.192.28"]
    certificate_name = "decisions-tribunals-gov-uk"
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
      }
    ]
  },
  {
    name             = "trib-admin-appeals"
    mode             = "Prevention"
    custom_domain    = "administrativeappeals.decisions.tribunals.gov.uk"
    backend_domain   = ["34.243.192.28"]
    certificate_name = "decisions-tribunals-gov-uk"
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
    name             = "trib-care-standards"
    mode             = "Prevention"
    custom_domain    = "carestandards.decisions.tribunals.gov.uk"
    backend_domain   = ["34.243.192.28"]
    certificate_name = "decisions-tribunals-gov-uk"
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "drpMainCategory"
      }
    ]
  },
  {
    name             = "trib-lands-chamber"
    mode             = "Prevention"
    custom_domain    = "landschamber.decisions.tribunals.gov.uk"
    backend_domain   = ["34.243.192.28"]
    certificate_name = "decisions-tribunals-gov-uk"
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name             = "trib-finance-tax"
    mode             = "Prevention"
    custom_domain    = "financeandtax.decisions.tribunals.gov.uk"
    backend_domain   = ["34.243.192.28"]
    certificate_name = "decisions-tribunals-gov-uk"
  },
  {
    name             = "trib-employment-appeals"
    mode             = "Prevention"
    custom_domain    = "employmentappeals.decisions.tribunals.gov.uk"
    backend_domain   = ["34.243.192.28"]
    certificate_name = "decisions-tribunals-gov-uk"
  },
  {
    name             = "trib-tansport-appeals"
    mode             = "Prevention"
    custom_domain    = "transportappeals.decisions.tribunals.gov.uk"
    backend_domain   = ["34.243.192.28"]
    certificate_name = "decisions-tribunals-gov-uk"
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "btnSearch"
      }
    ]
  },
  {
    name             = "trib-cicap"
    mode             = "Prevention"
    custom_domain    = "cicap.decisions.tribunals.gov.uk"
    backend_domain   = ["34.243.192.28"]
    certificate_name = "decisions-tribunals-gov-uk"
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "__VIEWSTATE"
      }
    ]
  }
]
