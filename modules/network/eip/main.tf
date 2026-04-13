resource "aws_eip" "eips" {
  for_each = var.azs
  domain   = "vpc"
  tags = {
    Name = "eip-${each.key}"
  }
}