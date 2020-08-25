provider "aws" {
  profile = "default"
  region  = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0a29fdbec053610a5"
  instance_type = "t2.micro"
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-XXX"          # s3 bucket 생성 후 출력되는 id 입력
    key            = "terraform/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}