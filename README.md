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
These are details on how to setup the Shuttern Pattern within this repository.<br/>
You can get more detail from [shutter-implementation-and-design](https://hmcts.github.io/ways-of-working/path-to-live/shutter.html#shutter-implementation-and-design)

Setting the below parameter within the `frontends` object array will tell the pipeline to create the storage account and CDN.

**Example**
```terraform
{
    name              = "my-application-name"
    custom_domain     = "my-application-name.platform.hmcts.net"
    backend_domain    = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    shutter_app       = true
    disabled_rules    = {}
    global_exclusions = []
  }
```

The storage account name will remove the `-` and take the first `8` characters of the `name` property. For example if the `name` was set to `my-application-name` then the storage account would use `myapplic` and be called `hmctsmyapplicshutterprod`.

You can then forward the website manually to the shutter by setting the `shutter: true` in the `azure-public-dns` repository.

### TLS
The shuttering service currently requires an ACME certificate, you will need to add the `certificate_name` field:
```terraform
{
  certificate_name = "{Certificate Name}"
}
```
