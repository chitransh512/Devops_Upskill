resource "aws_vpc" "main" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-vpc")
  )
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-main")
  )
}

#####################################################
# Public Subnets - Inbound/Outbound Internet Access #
#####################################################

resource "aws_subnet" "public_a" {
  cidr_block              = "10.1.1.0/28"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
  availability_zone       = "${data.aws_region.current.name}a"

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-a")
  )
}

resource "aws_route_table" "public_a" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-a")
  )
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_a.id
}

resource "aws_route" "public_internet_access_a" {
  route_table_id         = aws_route_table.public_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_eip" "public_a" {
  vpc = true

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-a")
  )
}

resource "aws_nat_gateway" "public_a" {
  allocation_id = aws_eip.public_a.id
  subnet_id     = aws_subnet.public_a.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-a")
  )
}

resource "aws_subnet" "public_b" {
  cidr_block              = "10.1.2.0/28"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
  availability_zone       = "${data.aws_region.current.name}b"

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-b")
  )
}

resource "aws_route_table" "public_b" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-b")
  )
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_b.id
}

resource "aws_route" "public_internet_access_b" {
  route_table_id         = aws_route_table.public_b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_eip" "public_b" {
  vpc = true

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-b")
  )
}

resource "aws_nat_gateway" "public_b" {
  allocation_id = aws_eip.public_b.id
  subnet_id     = aws_subnet.public_b.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-b")
  )
}

resource "aws_subnet" "public_c" {
  cidr_block              = "10.1.3.0/28"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
  availability_zone       = "${data.aws_region.current.name}c"

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-c")
  )
}

resource "aws_route_table" "public_c" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-c")
  )
}

resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.public_c.id
}

resource "aws_route" "public_internet_access_c" {
  route_table_id         = aws_route_table.public_c.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_eip" "public_c" {
  vpc = true

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-c")
  )
}

resource "aws_nat_gateway" "public_c" {
  allocation_id = aws_eip.public_c.id
  subnet_id     = aws_subnet.public_c.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-c")
  )
}

resource "aws_subnet" "public_d" {
  cidr_block              = "10.1.4.0/28"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
  availability_zone       = "${data.aws_region.current.name}d"

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-d")
  )
}

resource "aws_route_table" "public_d" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-d")
  )
}

resource "aws_route_table_association" "public_d" {
  subnet_id      = aws_subnet.public_d.id
  route_table_id = aws_route_table.public_d.id
}

resource "aws_route" "public_internet_access_d" {
  route_table_id         = aws_route_table.public_d.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_eip" "public_d" {
  vpc = true

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-d")
  )
}

resource "aws_nat_gateway" "public_d" {
  allocation_id = aws_eip.public_d.id
  subnet_id     = aws_subnet.public_d.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-public-d")
  )
}

###################################################
# Private Subnets - Outbound internet access only #
###################################################

resource "aws_subnet" "private_a" {
  cidr_block        = "10.1.5.0/28"
  vpc_id            = aws_vpc.main.id
  availability_zone = "${data.aws_region.current.name}a"

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-private-a")
  )
}

resource "aws_route_table" "private_a" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-private-a")
  )
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_a.id
}

resource "aws_route" "private_a_internet_out" {
  route_table_id         = aws_route_table.private_a.id
  nat_gateway_id         = aws_nat_gateway.public_a.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_subnet" "private_b" {
  cidr_block        = "10.1.6.0/28"
  vpc_id            = aws_vpc.main.id
  availability_zone = "${data.aws_region.current.name}b"

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-private-b")
  )
}

resource "aws_route_table" "private_b" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-private-b")
  )
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private_b.id
}

resource "aws_route" "private_b_internet_out" {
  route_table_id         = aws_route_table.private_b.id
  nat_gateway_id         = aws_nat_gateway.public_b.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_subnet" "private_c" {
  cidr_block        = "10.1.7.0/28"
  vpc_id            = aws_vpc.main.id
  availability_zone = "${data.aws_region.current.name}c"

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-private-c")
  )
}

resource "aws_route_table" "private_c" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-private-c")
  )
}

resource "aws_route_table_association" "private_c" {
  subnet_id      = aws_subnet.private_c.id
  route_table_id = aws_route_table.private_c.id
}

resource "aws_route" "private_c_internet_out" {
  route_table_id         = aws_route_table.private_c.id
  nat_gateway_id         = aws_nat_gateway.public_c.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_subnet" "private_d" {
  cidr_block        = "10.1.8.0/28"
  vpc_id            = aws_vpc.main.id
  availability_zone = "${data.aws_region.current.name}d"

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-private-d")
  )
}

resource "aws_route_table" "private_d" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-private-d")
  )
}

resource "aws_route_table_association" "private_d" {
  subnet_id      = aws_subnet.private_d.id
  route_table_id = aws_route_table.private_d.id
}

resource "aws_route" "private_d_internet_out" {
  route_table_id         = aws_route_table.private_d.id
  nat_gateway_id         = aws_nat_gateway.public_d.id
  destination_cidr_block = "0.0.0.0/0"
}