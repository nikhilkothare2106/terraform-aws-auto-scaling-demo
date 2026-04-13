# output "subnets" {
#   value = aws_subnet.subnets
# }


output "public_subnets" {
  value = local.public_subnets
}

output "public_subnets_az" {
  value = local.public_subnets_az
}

output "private_subnets" {
  value = local.private_subnets
}

output "azs" {
  value = toset([
    for subnet in local.private_subnets : subnet.az
  ])
}