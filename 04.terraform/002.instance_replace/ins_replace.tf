provider "aws" {
  profile = "default"
  region  = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0a29fdbec053610a5"  # 앞서 생성한 인스턴스는 terminated되며 새로 생성됨
  instance_type = "t2.micro"
}