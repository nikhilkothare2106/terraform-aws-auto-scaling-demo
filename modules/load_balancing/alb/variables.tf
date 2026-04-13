variable "alb_name" {
  description = "Name of the load balancer"
  type        = string
}
variable "lg_sg_id" {
  description = "Security group for load balancer"
}

# output "private_sg" {
#   value = aws_security_group.private_sg
#   description = "Security group for private instance"
# }

variable "public_subnets_az" {
  description = "All public subnets per AZ"
}