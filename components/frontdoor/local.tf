locals {
  criticality = {
    sbox     = "Low"
    aat      = "High"
    prod     = "High"
    demo     = "Medium"
    ithc     = "Medium"
    ldata    = "Medium"
    perftest = "Medium"
    preview  = "Medium"
    dev      = "Medium"
    test     = "Medium"
    stg      = "Medium"
  }

  env_display_names = {
    sbox     = "Sandbox"
    aat      = "Staging"
    prod     = "Production"
    demo     = "Demo"
    ithc     = "ITHC"
    ldata    = "LDATA"
    perftest = "Test"
    preview  = "Dev"
    dev      = "Dev"
    test     = "Test"
    stg      = "Staging"
  }

  common_tags = {
    "managedBy"          = "SharedServices"
    "solutionOwner"      = "SharedServices"
    "activityName"       = "AKS"
    "dataClassification" = "Internal"
    "automation"         = ""
    "costCentre"         = "10245117"
    // until we get a better one, this is the generic cft contingency one
    "environment" = local.env_display_names[var.env]
    "criticality" = local.criticality[var.env]
  }

}


