resource "aws_key_pair" "mykeypair" {   # ssh 접속용 key 위치 작성
  key_name   = "mykeypair"
  public_key = file(var.SSH_KEY)
}