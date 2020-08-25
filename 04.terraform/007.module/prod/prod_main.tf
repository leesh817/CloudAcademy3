provider "aws" {
  profile = "default"
  region  = "ap-northeast-2"
}

module "network" {                      # 모듈의 이름은 임의로 작성
  source = "../module/aws-network"

  CIDR_BLOCK = "1.0.0.0/16"             # 미리 변수로 cidr을 지정했지만 변경되며, 옵션들은 그대로 적용됨
}

resource "aws_instance" "example" {
  ami           = "ami-0a29fdbec053610a5"
  instance_type = "t2.micro"
  subnet_id     = module.network.subnet_id  # 생성되는 instance의 subnet은 모듈에서 생성한 subnet을 받아옴
}