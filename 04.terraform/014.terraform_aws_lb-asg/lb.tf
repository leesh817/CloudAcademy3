resource "aws_lb" "wp-lb" {                     # loadbalancer 생성
  name               = "wp-lb"
  internal           = false
  load_balancer_type = "network"                # NLB로 지정
  subnets = [                                   # loadbalancing 할 subnet 대역 지정
    aws_subnet.net-public[0].id,
    aws_subnet.net-public[1].id,
    aws_subnet.net-public[2].id
  ]

  enable_deletion_protection = false            # false로 지정해야 destroy 시 제거가 됨
}

resource "aws_lb_target_group" "wp-lb-tg" {     # loadbalancing 진행할 vpc와 open할 port 지정
  name     = "wp-lb-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.net.id
}

resource "aws_lb_listener" "wp-lb-front" {      # 외부에 노출할 loadbalancer와 port 번호 지정
  load_balancer_arn = aws_lb.wp-lb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wp-lb-tg.arn   # loadbalancing 넘겨줄 target group 지정
  }
}