# sds-azure-platform


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
    certificate_name  = "wildcard-platform-hmcts-net"
    shutter_app       = true
    disabled_rules    = {}
    global_exclusions = []
  }
```

The storage account name will remove the `-` and take the first `8` characters of the `name` property. For example if the `name` was set to `my-application-name` then the storage account would use `myapplic` and be called `hmctsmyapplicshutterprod`.

You can then forward the website manually to the shutter by setting the `shutter: true` in the `azure-public-dns` repository.