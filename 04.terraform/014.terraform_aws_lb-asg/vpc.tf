# VPC
resource "aws_vpc" "net" {
  cidr_block           = var.CIDR
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "tf-net"
  }
}

# Public Subnets
resource "aws_subnet" "net-public" {
  count = 3

  vpc_id                  = aws_vpc.net.id
  cidr_block              = cidrsubnet(var.CIDR, 8, (count.index + 1) * 10)
  map_public_ip_on_launch = "true"
  availability_zone       = var.AZS[count.index]

  tags = {
    Name = "tf-net-pub${count.index}"
  }
}

# Private Subnets
resource "aws_subnet" "net-private" {
  count = 3

  vpc_id                  = aws_vpc.net.id
  cidr_block              = cidrsubnet(var.CIDR, 8, (count.index + 4) * 10)
  map_public_ip_on_launch = "false"
  availability_zone       = var.AZS[count.index]

  tags = {
    Name = "tf-net-priv${count.index}"
  }
}
