resource "aws_db_instance" "wpdb" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mariadb"
  engine_version       = "10.4.8"
  instance_class       = "db.t2.micro"
  name                 = "wpdb"
  username             = "wpadm"
  password             = var.DB_PWD
  db_subnet_group_name = aws_db_subnet_group.mariadb-net-grp.name
  vpc_security_group_ids = [
    aws_security_group.sg-db-priv.id
  ]
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "mariadb-net-grp" {
  name = "mariadb-net-grp"
  subnet_ids = [
    aws_subnet.net-private[0].id,
    aws_subnet.net-private[1].id,
    aws_subnet.net-private[2].id
  ]
}


