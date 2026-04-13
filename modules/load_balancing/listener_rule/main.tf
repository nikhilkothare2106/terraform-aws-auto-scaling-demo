resource "aws_lb_listener_rule" "hello_rule" {
  listener_arn = var.listener_arn
  priority     = 1

  condition {
    path_pattern {
      values = ["/hello/*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = var.tg_hello_arn
  }
}

resource "aws_lb_listener_rule" "hi_rule" {
  listener_arn = var.listener_arn
  priority     = 2

  condition {
    path_pattern {
      values = ["/hi/*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = var.tg_hi_arn
  }
}