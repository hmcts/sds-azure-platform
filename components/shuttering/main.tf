module "shutter_page" {
  source      = "git::https://github.com/hmcts/azure-platform-terraform.git//modules/shutter_page?ref=master"
  env         = var.environment
  common_tags = module.ctags.common_tags

}

module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.environment
  product     = var.product
  builtFrom   = var.builtFrom
}