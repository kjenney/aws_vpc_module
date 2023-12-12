# aws_vpc_module

A Terraform module to create a VPC using an existing IPAM pool and an existing Transit Gateway

## Variables

* `ipam_pool_description` - The description set on the IPAM Pool
* `transit_gateway_name` - The name tag on the Transit Gateway
* `azs` - The availability zones to use. Defaults to first 2.
