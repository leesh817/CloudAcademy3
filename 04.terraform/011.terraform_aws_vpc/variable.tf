variable "AZS" {              # availability zone 작성
  type    = list(string)
  default = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
}

variable "CIDR" {             # 사용할 cidr 변수 정의 및 설정
  type    = string
  default = "192.168.0.0/16"
}

variable "AWS_REGION" {       # aws region 변수 정의 및 설정
  type    = string
  default = "ap-northeast-2"
}

variable "AWS_ACCESS_KEY" {   # access key 변수 정의
  type = string
}

variable "AWS_SECRET_KEY" {   # secret key 변수 정의
  type = string
}