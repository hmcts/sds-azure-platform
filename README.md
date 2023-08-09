# sds-azure-platform

## Frontdoor
To setup a basic Frontdoor configuration, go to the required environment within `environments` folder and edit the environments `tfvars` file.

Within the variable `frontends` add the basic object to the array:
```terraform
{
  name              = "{Sub-Domain Name}"
  custom_domain     = "{URL}"
  backend_domain    = ["{Backend URL or Firewall}"]
  disabled_rules    = {}
  global_exclusions = []
}
```

### TLS
By default it will use the Azure Frontdoor Managed Certificates, which will validate the URL against the DNS within the tenant then generate a certificate.

If you would like to use a certificate from the ACME Key Vaults managed by Platform Operations, then you can add the following properties:
```terraform
{
  certificate_name = "{Certificate Name}"
  ssl_mode         = "AzureKeyVault"
}
```

### Firewall URLs
These are the URLs for the Palo Alto Firewalls

| Environment | URL |
| -- | --|
| sbox | firewall-sbox-int-palo-sdssbox.uksouth.cloudapp.azure.com |
|demo | firewall-nonprodi-palo-sdsapimgmtdemo.uksouth.cloudapp.azure.com |
|dev | firewall-nonprodi-palo-sdsdev.uksouth.cloudapp.azure.com |
|ithc | firewall-nonprodi-palo-sdsithc.uksouth.cloudapp.azure.com |
|prod | firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com |
|stg | firewall-prod-int-palo-sdsstg.uksouth.cloudapp.azure.com |
|test | firewall-nonprodi-palo-sdstest.uksouth.cloudapp.azure.com |

## Shutter Pattern
You can get more detail from [shutter-implementation-and-design](https://hmcts.github.io/cloud-native-platform/path-to-live/shutter.html)

### TLS
The shuttering service currently requires an ACME certificate, you will need to add the `certificate_name` field:
```terraform
{
  certificate_name = "{Certificate Name}"
}
```
