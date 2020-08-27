output "bastion-instance-ip" {
  value = aws_instance.wp-web.public_ip
}

#output "private-instance-ip" {
#  value = aws_instance.private-inst.private_ip
#}

output "rds-endpoint" {       # Database instance 접근을 위한 endpoint 출력
  value = aws_db_instance.wpdb.endpoint
}