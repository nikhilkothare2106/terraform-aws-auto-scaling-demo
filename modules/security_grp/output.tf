output "lg_sg_id" {
  value       = aws_security_group.lb_sg.id
  description = "Security group for load balancer"
}

output "private_sg_id" {
  value       = aws_security_group.private_sg.id
  description = "Security group for private instance"
}

