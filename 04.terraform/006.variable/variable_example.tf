provider "aws" {
  region = var.AWS_REGION
}

resource "aws_instance" "test" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}