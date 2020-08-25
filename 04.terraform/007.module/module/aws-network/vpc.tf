resource "aws_vpc" "example" {
  cidr_block = var.CIDR_BLOCK              # cidr_block을 변수로 설정한 CIDR_BLOCK으로 대체함
}

resource "aws_subnet" "example" {
  vpc_id            = aws_vpc.example.id   # 서브넷 설정할 VPC 지정
  cidr_block        = cidrsubnet(aws_vpc.example.cidr_block, 4, 0)  # 서브넷 할당 기준 작성 / cidr_block에 저장된 value를 받아 4bit를 추가적으로 네트워크 ID로 세팅 후 서브넷팅을 진행, 첫번째 네트워크를 사용한다는 의미
  availability_zone = "ap-northeast-2a"
}