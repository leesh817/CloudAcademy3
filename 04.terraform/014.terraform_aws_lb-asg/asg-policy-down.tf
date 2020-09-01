resource "aws_autoscaling_policy" "wp-down-policy" {          # autoscaling policy 지정
  name                   = "wp-down-policy"
  autoscaling_group_name = aws_autoscaling_group.wp-asg.name  # autoscaling 할 group 지정
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"                               # instance 줄이는 조건이기 때문에 -1 작성
  cooldown               = "300"
}

resource "aws_cloudwatch_metric_alarm" "wp-watch-lt-10" {     # alarm 제작
  alarm_name          = "wp-watch-lt-10"
  comparison_operator = "LessThanOrEqualToThreshold"          # alarm 조건 지정
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"                      # alarm 기준 지정
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "10"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.wp-asg.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.wp-down-policy.arn]   # alarm의 영향을 받을 policy 지정
}