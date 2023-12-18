data "aws_vpc_ipam_pool" "my_pool" {
  filter {
    name   = "description"
    values = [var.ipam_pool_description]
  }
}

data "aws_ec2_transit_gateway" "my_tgw" {
  filter {
    name   = "tag:Name"
    values = [var.transit_gateway_name]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
