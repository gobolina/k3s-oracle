variable "compartment_ocid" {}
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_name" {}

locals {
  core_cidr_blocks            = ["10.0.0.0/16"]
  ssh_managemnet_network = "1.1.1.1/32"
}
