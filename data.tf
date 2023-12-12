data "aws_vpc_ipam_pool" "my_pool" {
  filter {
    name   = "description"
    values = [var.ipam_pool_description]
  }
}

data "aws_vpc_ipam_preview_next_cidr" "previewed_cidr" {
  ipam_pool_id    = data.aws_vpc_ipam_pool.my_pool.id
  netmask_length  = 22
}


data "aws_ec2_transit_gateway" "my_tgw" {
  filter {
    name   = "tag:Name"
    values = [var.transit_gateway_description]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
