resource "aws_instance" "wp-web" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.net-public[0].id
  vpc_security_group_ids = [
    aws_security_group.sg-ssh-pub.id,
    aws_security_group.sg-web-pub.id
  ]
  key_name = aws_key_pair.mykeypair.key_name

  user_data = file(var.WP_SCRIPT)             # instance 생성 시 자동으로 진행해야 할 init 작성
}