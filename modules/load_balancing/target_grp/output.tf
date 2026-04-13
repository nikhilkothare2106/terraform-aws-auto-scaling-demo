output "tg_hello_arn" {
  value = aws_lb_target_group.hello_tg.arn
}

output "tg_hi_arn" {
  value = aws_lb_target_group.hi_tg.arn
}