provider "aws" {
  profile = "default"
  region  = "ap-northeast-2"
}

resource "aws_key_pair" "example" {
  key_name   = "example-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
# SSH 접속할 Key 지정

resource "aws_instance" "example" {
  ami                    = "ami-05438a9ce08100b25"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.example.key_name  # 암시적 종속성으로 앞서 선언한 key pair를 가져옴
  vpc_security_group_ids = [aws_security_group.example-sg.id]
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
  provisioner "remote-exec" {  # 생성한 instance에서 실행할 명령어 작성
    inline = [
      "sudo apt update", # ubuntu일때 항시 update 진행해야 함
      "sudo apt install -y nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
    ]
  }
  provisioner "local-exec" {   # local에서 진행할 명령어 입력
    command = "echo ${aws_instance.example.public_ip} > ipaddr.txt" # ${self.public_ip}로 대체 가능
  }
}

resource "aws_security_group" "example-sg" {  # remote-exec, local-exec를 사용하기 위하여 보안그룹의 port open
  name = "allow-ssh-web"
  egress {  # instance에서 외부로 전송할 트래픽 규칙 작성
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {  # instance에서 내부로 받을 트래픽 규칙 작성
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH의 경우 외부에 누출되지 않도록 개인IP를 작성하는 것이 보안상 좋음(ipconfig.co.kr)
  }                              # ex) 218.152.123.251/32
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}