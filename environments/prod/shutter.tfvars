# Common variables - do not change these

env                 = "prod"
cdn_sku             = "Standard_Verizon"
resource_group_name = "shutter-app-rg"

# This is to create a storage account for your teams shutetr page that can be used for multiple applications.

pip_shutter_storage = "pip"

# comma separated FQDN that needs to have the shutter page from the above storage account.
pip_shutter_apps = [
    "pip-frontend.platform.hmcts.net"  
]