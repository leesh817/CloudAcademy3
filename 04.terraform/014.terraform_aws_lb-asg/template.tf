resource "aws_launch_template" "wp-template" {
  name          = "wp-template"
  image_id      = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykeypair.key_name
  vpc_security_group_ids = [
    aws_security_group.sg-ssh-pub.id,
    aws_security_group.sg-web-pub.id
  ]
  user_data = filebase64(var.WP_SCRIPT)
}

