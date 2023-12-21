locals {
  cidr              = aws_vpc.my_vpc.cidr_block
  zones             = 4
  ipv4_step           = length(local.azs) > 3 ? 2 : 1 # The more subnets we have the more room we'll need for our IP space
  private_newbits   = 3
  public_newbits    = 3
  public_netnum_add = 4
  azs               = slice(coalesce(var.azs, data.aws_availability_zones.available.names), 0, local.zones)

  # IPv4 subnets
  private_subnets     = [for k, v in local.azs : cidrsubnet(var.cidr, local.private_newbits, k)]
  public_subnet      = cidrsubnet(var.cidr, local.public_newbits, local.ipv4_step + length(local.azs))
}
