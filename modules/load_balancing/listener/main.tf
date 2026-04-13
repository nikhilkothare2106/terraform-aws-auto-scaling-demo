resource "aws_lb_listener" "listener_alb" {
  load_balancer_arn = var.alb_arn
  default_action {
    type = "forward"
    forward {
      target_group {
        arn = var.tg_hello_arn
      }
      target_group {
        arn = var.tg_hi_arn
      }
    }
  }

  port     = 80
  protocol = "HTTP"
}

