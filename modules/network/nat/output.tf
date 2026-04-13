output "nats" {
  value = {
    for key, nat in aws_nat_gateway.nats :
    key => {
      id = nat.id
    }
  }
}


output "demo" {
  value = var.public_subnets_az
}