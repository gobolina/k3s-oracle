variable "compartment_id" {
  description = "OCI Compartment ID"
  type        = string
}

variable "tenancy_ocid" {
  description = "The tenancy OCID."
  type        = string
}

variable "vpc_cidr" {}
variable "public_subnet" {}
variable "private_subnet" {}

variable "whitelist_ips" {
  description = "The ips to allow access to kube api"
}

variable "kube_api_port" {
  type    = number
  default = 6443
}
