resource "aws_subnet" "subnets" {
  vpc_id   = var.vpc_id
  for_each = var.subnet_config

  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

locals {
  public_subnets = {
    for key, subnet in aws_subnet.subnets :
    key => {
      id = subnet.id
      az = subnet.availability_zone
    }
    if var.subnet_config[key].public
  }


  public_subnets_az = {
    for key, subnet in aws_subnet.subnets :
    subnet.availability_zone => {
      id   = subnet.id
      name = key
    }...
    if var.subnet_config[key].public
  }
  private_subnets = {
    for key, subnet in aws_subnet.subnets :
    key => {
      id = subnet.id
      az = subnet.availability_zone
    }
    if !var.subnet_config[key].public
  }
}