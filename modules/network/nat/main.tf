
# resource "aws_nat_gateway" "nats" {
#    for_each = var.eips
#   subnet_id     = var.public_subnet_az[each.key][0].id
#   allocation_id = var.eips[each.key].id
#   tags = { Name = "nat-${each.key}" }
# }



resource "aws_nat_gateway" "nats" {
  for_each = var.eips

  subnet_id     = var.public_subnets_az[each.key][0].id
  allocation_id = var.eips[each.key].id

  tags = {
    Name = "nat-${each.key}"
  }
}