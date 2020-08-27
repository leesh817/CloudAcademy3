resource "aws_db_instance" "wpdb" {         # Database instance 생성
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mariadb"
  engine_version = "10.4.8"
  instance_class = "db.t2.micro"
  name = "wpdb"
  username = "wpadm"
  password = var.DB_PWD                     # 생성되는 Database의 password는 변수로 받음
  db_subnet_group_name = aws_db_subnet_group.mariadb-net-grp.name     # Database instance 생성 될 subnet group 지정
  vpc_security_group_ids = [                # Database instance의 security group 지정
    aws_security_group.sg-db-priv.id
  ]
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "mariadb-net-grp" {  # Database instance 생성 될 subnet group 생성
  name = "mariadb-net-grp"
  subnet_ids = [                    # private subnet 지정
    aws_subnet.net-private[0].id,
    aws_subnet.net-private[1].id,
    aws_subnet.net-private[2].id
  ]
}
