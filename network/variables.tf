variable "compartment_id" {
  description = "OCI Compartment ID"
  type        = string
}

variable "tenancy_ocid" {
  description = "The tenancy OCID."
  type        = string
}

variable "core_cidr_blocks" {
  description = "CIDRs of the network, use index 0 for everything"
  type        = list(any)
}
