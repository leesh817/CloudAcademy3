resource "aws_instance" "bastion" {             # public IP를 가진 instance 생성
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.net-public[0].id   # public subnet에서 IP 할당
  vpc_security_group_ids = [
    aws_security_group.sg-ssh-pub.id            # ssh를 위한 security group 선언
  ]
  key_name = aws_key_pair.mykeypair.key_name    # ssh 접속을 위한 key 선언
}

resource "aws_instance" "private-inst" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.net-private[0].id
  vpc_security_group_ids = [
    aws_security_group.sg-ssh-priv.id         # ssh 접속을 위한 security group 선언
  ]
  key_name = aws_key_pair.mykeypair.key_name
}