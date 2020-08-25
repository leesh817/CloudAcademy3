output "ip" {
  value       = aws_instance.test.public_ip
  description = "Public IP by Instance"
}