provider "aws" {
  profile = "default"
  region  = "ap-northeast-2"
}

resource "aws_instance" "example1" {
  ami           = "ami-05438a9ce08100b25"
  instance_type = "t2.micro"
  
  depends_on    = [aws_s3_bucket.example]
}
# example1 instance의 경우 bucket을 종속적인 리소스로 받음
# 명시적 종속성이라고 칭하며, 리소스 정의 시 사용자가 직접 리소스 사이의 의존성을 명확히 명시

resource "aws_instance" "example2" {
  ami           = "ami-05438a9ce08100b25"
  instance_type = "t2.micro"
}
#example2 instance에는 다른 리소스 의존이 없음

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example1.id
}
# example1 instance에 elasticIP를 적용함
# 암시적 종속성이라고 칭하며, terraform이 자동으로 리소스 사이의 의존성을 분석해 리소스의 변경,생성,삭제 등의 순서를 결정
# elasticIP 할당 전 instance가 먼저 생성되어 있어야 함

resource "aws_s3_bucket" "example" {
  bucket = "terraform-test-bucket-abcd"  # bucket의 name은 유일해야 함
  acl    = "private"
}