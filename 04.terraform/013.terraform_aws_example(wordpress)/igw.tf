# Internet GW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.net.id

  tags = {
    Name = "tf-igw"
  }
}

# Routing Table for Internet
resource "aws_route_table" "route-pub" {
  vpc_id = aws_vpc.net.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "tf-route-pub"
  }
}

# Routing Table associate for Public Subnet
resource "aws_route_table_association" "route-associate-pub" {
  count = 3

  subnet_id      = aws_subnet.net-public[count.index].id
  route_table_id = aws_route_table.route-pub.id
}