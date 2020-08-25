provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-${random_string.random.result}"
  acl    = "private"

  versioning {
    enabled = true
  }  # version 관리 기능을 시작한 것이며, instance 및 s3 삭제 시 콘솔 내부에서 s3에 진입하여 내용을 삭제 후 destroy 진행
}

resource "random_string" "random" {
  length  = 10
  upper   = false
  special = false
}

output "bucket-name" {
  value = aws_s3_bucket.terraform-state.id
}  # instance.tf에 bucket id를 사용하기 위하여 최종 화면에 출력