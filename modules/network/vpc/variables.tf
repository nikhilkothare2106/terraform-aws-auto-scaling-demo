variable "vpc_config" {
  description = "Vpc information"
  type = object({
    cidr_block = string
    name       = string
  })
}