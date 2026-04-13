variable "vpc_config" {
  description = "Vpc information"
  type = object({
    cidr_block = string
    name       = string
  })
}

variable "region" {
  description = "Region"
  type        = string
}

variable "subnet_config" {
  description = "CIDR and AZ of Subnets"
  type = map(object({
    cidr_block = string
    az         = string
    public     = optional(bool, false)

  }))
}
variable "alb_name" {
  description = "Name of the load balancer"
  type        = string
}

variable "ami_id" {
  description = "AMI id"
  type        = string
}


variable "asg_max_size" {
  description = "Max capacity of ASG"
}

variable "asg_min_size" {
  description = "Min capacity of ASG"
}
variable "desired_capacity" {
  description = "Desired capacity of ASG"
}