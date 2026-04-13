resource "aws_internet_gateway" "igw_1" {
  vpc_id = var.vpc_id
  tags = {
    Name = "igw-1"
  }
}