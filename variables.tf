variable "ipam_pool_description" {}
variable "transit_gateway_description" {}
variable "azs" {
  description = "The specific Availability Zones to use for our VPC. Will only take the first 3."
  type        = list(string)
  default     = null
}
