output "alb_arn" {
  value       = aws_lb.alb_1.arn
  description = "ARN of application load balancer"
}