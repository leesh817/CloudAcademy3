terraform {                 # terraform cloud 사용을 위한 backend.tf 제작
  backend "remote" {
    organization = "XXX"

    workspaces {
      name = "XXX"
    }
  }
}