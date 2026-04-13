---

# terraform-aws-vpc

## Overview

This Terraform module provisions a complete AWS infrastructure setup including:

* A Virtual Private Cloud (VPC)
* Public and private subnets across multiple Availability Zones
* Internet Gateway (IGW)
* Route tables
* Application Load Balancer (ALB)
* Launch Templates
* Two Auto Scaling Groups for:

  * `hello` service
  * `hi` service

---

## Features

- Creates a VPC with a specified CIDR block
- Creates public and private subnets across multiple AZs
- Attaches an Internet Gateway (IGW) for public subnets
- Configures route tables for public and private subnets
- Deploys an Application Load Balancer (ALB)
- Creates Target Groups for services
- Creates Launch Templates
- Configures Auto Scaling Groups (ASG) for high availability

---

## Usage

```hcl
vpc_config = {
  cidr_block = "10.0.0.0/16"
  name       = "vpc_1"
}

region   = "ap-south-1"
alb_name = "alb-demo"
ami_id   = "ami-048f4445314bcaa09"

asg_min_size     = 1
asg_max_size     = 2
desired_capacity = 1

subnet_config = {
  "public_subnet_1" = {
    cidr_block = "10.0.0.0/24"
    az         = "ap-south-1a"
    public     = true
  }

  "private_subnet_1" = {
    cidr_block = "10.0.1.0/24"
    az         = "ap-south-1a"
  }

  "public_subnet_2" = {
    cidr_block = "10.0.2.0/24"
    az         = "ap-south-1c"
    public     = true
  }

  "private_subnet_2" = {
    cidr_block = "10.0.3.0/24"
    az         = "ap-south-1c"
  }

  "public_subnet_3" = {
    cidr_block = "10.0.4.0/24"
    az         = "ap-south-1b"
    public     = true
  }

  "private_subnet_3" = {
    cidr_block = "10.0.5.0/24"
    az         = "ap-south-1b"
  }
}
```

---

## Notes

- Public subnets are used for:
  - Load Balancer
  - Internet-facing resources

- Private subnets are used for:
  - Application services (`hi`, `hello`)
  - Auto Scaling Groups

---
