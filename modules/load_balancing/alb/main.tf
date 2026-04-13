resource "aws_lb" "alb_1" {
  name               = var.alb_name
  load_balancer_type = "application"
  internal           = false
  security_groups    = [var.lg_sg_id]

  subnets = [
    for az, subnets in var.public_subnets_az :
    subnets[0].id
  ]

  ip_address_type = "ipv4"

}