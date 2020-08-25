provider "aws" {
  profile = "default"
  region  = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0e3aff8ba008fd9f7"  # region, version마다 ami ID가 다름 (https://cloud-images.ubuntu.com/locator/ec2/)
  instance_type = "t2.micro"
}