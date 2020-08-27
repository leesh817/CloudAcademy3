resource "aws_ebs_volume" "wp-ebs" {              # wordpress 설정파일 저장 될 ebs 생성
  availability_zone = var.AZS[0]
  size              = 1

  tags = {
    Name = "wp-ebs"
  }
}

resource "aws_volume_attachment" "wp-web-ebs" {   # 생성한 ebs volume과 instance 연결
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.wp-ebs.id
  instance_id = aws_instance.wp-web.id
}
