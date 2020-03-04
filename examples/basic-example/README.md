# ECS Spot Instance basic example

Configuration in this directory creates set of ECS spot instance resources.

Data sources are used to discover existing vpc, vswitch and security groups.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources which cost money. Run `terraform destroy` when you don't need these resources.
