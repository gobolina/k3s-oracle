terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = "5.23.0"
    }
  }
}

resource "oci_core_vcn" "cluster_network" {
  compartment_id = var.compartment_id

  cidr_blocks = var.core_cidr_blocks

  display_name = "cluster-vcn"
  dns_label    = "internal"
}


resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.cluster_network.id
  enabled        = true
}
