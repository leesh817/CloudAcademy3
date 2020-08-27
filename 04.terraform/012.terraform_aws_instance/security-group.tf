resource "aws_security_group" "sg-ssh-pub" {
  vpc_id = aws_vpc.net.id
  name   = "allow-ssh-pub"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MGMT_IP]             # public instance에서 외부에서 ssh 접속 가능한 IP 지정
  }

  tags = {
    Name = "allow-ssh-pub"
  }
}

resource "aws_security_group" "sg-ssh-priv" {
  vpc_id = aws_vpc.net.id
  name   = "allow-ssh-priv"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"                    # private instance에서 외부에서 ssh 접속 가능한 IP 지정
    cidr_blocks = [var.CIDR]
  }

  tags = {
    Name = "allow-ssh-priv"
  }
}

resource "aws_security_group" "sg-web-pub" {
  vpc_id = aws_vpc.net.id
  name   = "allow-web-pub"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"                   # web service 사용 시 외부에서 접근 가능한 port와 cidr 설정
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-web-pub"
  }
}