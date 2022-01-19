resource "aws_vpc" "vpc" {
  cidr_block       = "${var.vpc_cidr_block}"
  instance_tenancy = "default"

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_subnet" "public_subnet" {
  count             = "${length(var.public_subnets)}"

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "${var.public_subnets[count.index]}"
  availability_zone = "${var.availability_zones[count.index]}"

  tags = {
    Name = "${var.project_name}-public-subnet"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-public-route-table"
  }
}

resource "aws_route_table_association" "public_route" {
  count          = "${length(var.public_subnets)}"

  subnet_id      = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = aws_route_table.public_route_table.id
}

/*
resource "aws_vpc_peering_connection" "pcx" {
  peer_owner_id = ${var.owner_id} (Defaults to the account ID the AWS provider is currently connected to.)
  peer_vpc_id   = aws_vpc.vpc2.id
  vpc_id        = aws_vpc.vpc.id
  peer_region   = ${var.region}
  auto_accept   = true

  tags = {
    Name = "pcx-vpc-vpc2"
  }
}
*/
