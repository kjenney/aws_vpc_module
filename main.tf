resource "aws_vpc" "my_vpc" {
  ipv4_ipam_pool_id   = data.aws_vpc_ipam_pool.my_pool.id
  ipv4_netmask_length = 22

  enable_dns_hostnames = true

  tags = {
    Name = "My-VPC"
  }
}

resource "aws_subnet" "private_subnets" {
  count                 = length(local.private_subnets)
  availability_zone     = length(regexall("^[a-z]{2}-", element(local.azs, count.index))) > 0 ? element(local.azs, count.index) : null
  cidr_block            = local.private_subnets[count.index]
  vpc_id                = aws_vpc.my_vpc.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "my_tgw_attachment" {
  subnet_ids         = aws_subnet.private_subnets[*].id
  transit_gateway_id = data.aws_ec2_transit_gateway.my_tgw.id
  vpc_id             = aws_vpc.my_vpc.id

  tags = {
    Name = "My-VPC-TGW-Attachment"
  }
}
