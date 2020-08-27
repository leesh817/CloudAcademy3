variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}

variable "AWS_REGION" {
  type = string
}

variable "AMI" {
  type = map(string)
  default = {
    ap-northeast-1 = "ami-0a6b0b4394b2e9a13"
    ap-northeast-2 = "ami-0a29fdbec053610a5"
  }
}