# EIP for NAT GW
resource "aws_eip" "ngw-eip" {
  vpc = true
}

# NAT Gateway
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw-eip.id
  subnet_id     = aws_subnet.net-public[0].id
  depends_on    = [aws_internet_gateway.igw]

  tags = {
    Name = "tf-ngw"
  }
}

# Routing Table for NAT
resource "aws_route_table" "route-nat" {
  vpc_id = aws_vpc.net.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "tf-route-nat"
  }
}

# Routing Table associations for Private Subnet
resource "aws_route_table_association" "route-associate-priv" {
  count = 3

  subnet_id      = aws_subnet.net-private[count.index].id
  route_table_id = aws_route_table.route-nat.id
}
