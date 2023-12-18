locals {
  cidr              = aws_vpc.my_vpc.cidr_block
  zones             = 2
  private_newbits   = 2
  public_newbits    = 3
  public_netnum_add = 4
  azs               = slice(coalesce(var.azs, data.aws_availability_zones.available.names), 0, local.zones)

  # IPv4 subnets
  private_subnets   = [for k, v in local.azs : cidrsubnet(local.cidr, local.private_newbits, k)]
  public_subnets    = [for k, v in local.azs : cidrsubnet(local.cidr, local.public_newbits, k + local.public_netnum_add)]
}
