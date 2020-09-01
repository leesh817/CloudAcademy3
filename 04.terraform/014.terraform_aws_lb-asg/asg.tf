resource "aws_autoscaling_group" "wp-asg" {         # AutoScalingGroup 생성
  name = "wp-asg"
  vpc_zone_identifier = [                           # VPC zone 작성
    aws_subnet.net-public[0].id,
    aws_subnet.net-public[1].id,
    aws_subnet.net-public[2].id
  ]
  min_size                  = 1                     # 최소 instance 개수 설정
  max_size                  = 3                     # 최대 instance 개수 설정
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  target_group_arns         = [aws_lb_target_group.wp-lb-tg.arn]    # loadbalancing 진행 할 lb_target_group 지정

  launch_template {
    id      = aws_launch_template.wp-template.id    # instance template 지정
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}