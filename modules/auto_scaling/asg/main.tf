resource "aws_autoscaling_group" "hello-asg" {
  name             = "hello-asg"
  max_size         = var.asg_max_size
  min_size         = var.asg_min_size
  desired_capacity = var.desired_capacity

  launch_template {
    id      = var.hello_lt_id
    version = "$Latest"
  }

  vpc_zone_identifier = [for subnet in var.private_subnets: subnet.id]

  target_group_arns         = [var.tg_hello_arn]
  health_check_type         = "EC2"
  health_check_grace_period = 300


  tag {
    key                 = "Name"
    value               = "ASG-hello"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "hi-asg" {
  name             = "hi-asg"
  max_size         = var.asg_max_size
  min_size         = var.asg_min_size
  desired_capacity = var.desired_capacity

  launch_template {
    id      = var.hi_lt_id
    version = "$Latest"
  }

  vpc_zone_identifier = [for subnet in var.private_subnets: subnet.id]

  target_group_arns         = [var.tg_hi_arn]
  health_check_type         = "EC2"
  health_check_grace_period = 300


  tag {
    key                 = "Name"
    value               = "ASG-hi"
    propagate_at_launch = true
  }
}