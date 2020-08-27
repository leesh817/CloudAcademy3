provider "aws" {                                    # 사용할 public cloud 정의
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_vpc" "test" {                         # vpc 생성
  cidr_block           = var.CIDR                   # cidr 변수에서 받아옴
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "terraform-test"                         # tag 생성
  }
}

resource "aws_subnet" "test-public" {               # public subnet 생성
  count = 3

  vpc_id                  = aws_vpc.test.id
  cidr_block              = cidrsubnet(var.CIDR, 8, (count.index + 1) * 10)   # cidrsubnet 함수 사용하여 cidr 설정
  map_public_ip_on_launch = "true"                  # public subnet 선언
  availability_zone       = var.AZS[count.index]    # zone 설정

  tags = {
    Name = "terraform-test-public${count.index}"    # tag 생성
  }
}

resource "aws_subnet" "test-private" {              # private subnet 생성
  count = 3                                         # 3번 반복

  vpc_id                  = aws_vpc.test.id
  cidr_block              = cidrsubnet(var.CIDR, 8, (count.index + 4) * 10)
  map_public_ip_on_launch = "false"                 # private subnet 선언
  availability_zone       = var.AZS[count.index]

  tags = {
    Name = "terraform-test-private${count.index}"
  }
}

resource "aws_internet_gateway" "test-igw" {        # public subnet과 외부 연결용 internet gateway 생성
  vpc_id = aws_vpc.test.id

  tags = {
    Name = "terraform-test-igw"
  }
}

resource "aws_eip" "test-eip" {                     # NAT gateway에 선언할 elastic IP 생성
  vpc = true
}

resource "aws_nat_gateway" "test-ngw" {             # private subnet 외부 통신용 NAT gateway 생성
  allocation_id = aws_eip.test-eip.id
  subnet_id     = aws_subnet.test-public[0].id
  depends_on    = [aws_internet_gateway.test-igw]

  tags = {
    Name = "terraform-test-ngw"
  }
}

resource "aws_route_table" "test-pub-route" {       # public subnet의 route table 생성
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "0.0.0.0/0"                        # 외부에서 모든 IP를 받음
    gateway_id = aws_internet_gateway.test-igw.id
  }

  tags = {
    Name = "tf-route-pub"
  }
}

resource "aws_route_table" "test-priv-route" {      # private subnet의 route table 생성
  vpc_id = aws_vpc.test.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.test-ngw.id
  }

  tags = {
    Name = "tf-route-nat"
  }
}

resource "aws_route_table_association" "route-ass-pub" {    # public subnet과 route table 연결
  count = 3

  subnet_id      = aws_subnet.test-public[count.index].id
  route_table_id = aws_route_table.test-pub-route.id
}

resource "aws_route_table_association" "route-ass-priv" {   # private subnet과 route table 연결
  count = 3

  subnet_id      = aws_subnet.test-private[count.index].id
  route_table_id = aws_route_table.test-priv-route.id
}