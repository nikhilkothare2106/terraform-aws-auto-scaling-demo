variable "subnet_config" {
  description = "CIDR and AZ of Subnets"
  type = map(object({
    cidr_block = string
    az         = string
    public     = optional(bool, false)
  }))
  validation {
    # condition = can(cidrnetmask(var.subnet_config.cidr_block))
    condition = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])

    error_message = "Invalid CIDR format"
  }
}

variable "vpc_id" {
  description = "Id of the vpc"
  type        = string
}