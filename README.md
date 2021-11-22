Alibaba Cloud ECS Spot Instance Terraform Module
terraform-alicloud-ecs-spot-instance
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-ecs-spot-instance/blob/master/README-CN.md)

Terraform module for creating Spot instance(s) on Alibaba Cloud.

These types of resources are supported:

* [ECS Instance](https://www.terraform.io/docs/providers/alicloud/r/instance.html)


## Usage

```hcl
module "ecs_spot_instance" {
  source                      = "terraform-alicloud-modules/ecs-spot-instance/alicloud"
  instance_type_family        = "ecs.g6"
  vswitch_id                  = "vsw-fhuqie"
  security_group_ids          = ["sg-12345678"]
  associate_public_ip_address = true
  internet_max_bandwidth_out  = 10
  
  #######################
  #spot strategy setting#
  #######################
  spot_strategy               = "SpotWithPriceLimit"
  spot_price_limit            = 0.5
}

```

## Examples

* [Basic example](https://github.com/terraform-alicloud-modules/terraform-alicloud-ecs-spot-instance/tree/master/examples/basic-example)

## Notes
From the version v1.1.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/ecs-spot-instance"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.0.0:

```hcl
module "ecs_spot_instance" {
  source  = "terraform-alicloud-modules/ecs-spot-instance/alicloud"
  version     = "1.0.0"
  region      = "cn-beijing"
  profile     = "Your-Profile-Name"
  instance_type_family        = "ecs.g6"
  vswitch_id                  = "vsw-fhuqie"
  // ...
}
```

If you want to upgrade the module to 1.1.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
}
module "ecs_spot_instance" {
  source  = "terraform-alicloud-modules/ecs-spot-instance/alicloud"
  instance_type_family        = "ecs.g6"
  vswitch_id                  = "vsw-fhuqie"
  // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
  alias   = "bj"
}
module "ecs_spot_instance" {
  source  = "terraform-alicloud-modules/ecs-spot-instance/alicloud"
  providers = {
    alicloud = alicloud.bj
  }
  instance_type_family        = "ecs.g6"
  vswitch_id                  = "vsw-fhuqie"
  // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
