output "wp-lb-public-dns" {
  value = aws_lb.wp-lb.dns_name
}

output "rds-endpoint" {
  value = aws_db_instance.wpdb.endpoint
}
