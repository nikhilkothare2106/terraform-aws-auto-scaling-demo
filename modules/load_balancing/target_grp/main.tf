resource "aws_lb_target_group" "hello_tg" {
  name     = "hello-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_type = "instance"
}


resource "aws_lb_target_group" "hi_tg" {
  name     = "hi-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_type = "instance"
}
