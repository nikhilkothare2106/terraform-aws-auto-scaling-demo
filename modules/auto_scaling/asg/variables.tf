variable "asg_max_size" {
  description = "Max capacity of ASG"
}

variable "asg_min_size" {
  description = "Min capacity of ASG"
}

variable "desired_capacity" {
  description = "Desired capacity of ASG"
}

variable "hello_lt_id" {
  description = "Id of hello Launch Template"
  type        = string
}

variable "hi_lt_id" {
  description = "Id of hi Launch Template"
  type        = string
}

variable "private_subnets" {
  description = "All public subnets"
}

variable "tg_hello_arn" {
  description = "Hi Target Group"
  type        = string
}

variable "tg_hi_arn" {
  description = "Hi Target Group"
  type        = string
}