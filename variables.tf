variable "compartment_ocid" {}
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_name" {}
variable "whitelist_ips" {}

locals {
  vpc_cidr = "10.0.0.0/16"
  public_subnet = "10.0.0.0/23"
  private_subnet = "10.0.2.0/23"
}
