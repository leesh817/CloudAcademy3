output "bastion-instance-ip" {
  value = aws_instance.bastion.public_ip
}       # aws에서 'bastian' instance 생성 완료 후 화면에 public IP 출력

output "private-instance-ip" {
  value = aws_instance.private-inst.private_ip
}       # aws에서 'private-inst' instance 생성 완료 후 화면에 private IP 출력