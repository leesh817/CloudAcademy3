variable "AWS_REGION" {
  type    = string
  default = "ap-northeast-2"
}

variable "AZS" {
  type    = list(string)
  default = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
}

variable "MGMT_IP" {
  type    = string
  default = "---"                     # 외부에서 접근하는 IP 지정
}

variable "CIDR" {
  type    = string
  default = "192.168.0.0/16"
}

variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}

variable "SSH_KEY" {
  type    = string
  default = "./keypair/mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-northeast-1 = "ami-0a6b0b4394b2e9a13",
    ap-northeast-2 = "ami-0a29fdbec053610a5"
  }
}
