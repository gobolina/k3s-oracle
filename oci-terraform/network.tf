resource "oci_core_vcn" "cluser_vcn" {
  cidr_block     = var.oci_core_vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = "k3s-cluster-vcn"
  dns_label      = var.oci_core_vcn_dns_label
  freeform_tags = {
    "provisioner"           = "tofu"
    "environment"           = "${var.environment}"
    "${var.unique_tag_key}" = "${var.unique_tag_value}"
  }
}

resource "oci_core_subnet" "default_oci_core_subnet10" {
  cidr_block        = var.oci_core_subnet_cidr10
  compartment_id    = var.compartment_ocid
  display_name      = "${var.oci_core_subnet_cidr10} public"
  dns_label         = var.oci_core_subnet_dns_label10
  route_table_id    = oci_core_vcn.cluser_vcn.default_route_table_id
  vcn_id            = oci_core_vcn.cluser_vcn.id
  security_list_ids = [oci_core_default_security_list.default_security_list.id]
  freeform_tags = {
    "provisioner"           = "tofu"
    "environment"           = "${var.environment}"
    "${var.unique_tag_key}" = "${var.unique_tag_value}"
  }
}

resource "oci_core_subnet" "oci_core_subnet11" {
  cidr_block        = var.oci_core_subnet_cidr11
  compartment_id    = var.compartment_ocid
  display_name      = "${var.oci_core_subnet_cidr11} private"
  dns_label         = var.oci_core_subnet_dns_label11
  # dns_label         = "private"
  route_table_id    = oci_core_vcn.cluser_vcn.default_route_table_id
  # route_table_id = oci_core_route_table.private_subnet.id
  vcn_id            = oci_core_vcn.cluser_vcn.id
  security_list_ids = [oci_core_default_security_list.default_security_list.id]
  freeform_tags = {
    "provisioner"           = "tofu"
    "environment"           = "${var.environment}"
    "${var.unique_tag_key}" = "${var.unique_tag_value}"
  }
}


resource "oci_core_internet_gateway" "default_oci_core_internet_gateway" {
  compartment_id = var.compartment_ocid
  display_name   = "Internet Gateway Default OCI core vcn"
  enabled        = "true"
  vcn_id         = oci_core_vcn.cluser_vcn.id
  freeform_tags = {
    "provisioner"           = "tofu"
    "environment"           = "${var.environment}"
    "${var.unique_tag_key}" = "${var.unique_tag_value}"
  }
}

resource "oci_core_default_route_table" "default_oci_core_default_route_table" {
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.default_oci_core_internet_gateway.id
  }
  manage_default_resource_id = oci_core_vcn.cluser_vcn.default_route_table_id
}


# resource "oci_core_nat_gateway" "private_subnet_gateway" {
#   compartment_id = var.compartment_ocid
#   vcn_id         = oci_core_vcn.cluser_vcn.id
#   display_name   = "private-subnet-gateway"
# }


# resource "oci_core_route_table" "private_subnet" {
#   compartment_id = var.compartment_ocid
#   vcn_id         = oci_core_vcn.cluser_vcn.id

#   display_name = "private_subnet_natgw"

#   route_rules {
#     network_entity_id = oci_core_nat_gateway.private_subnet_gateway.id

#     description = "k8s private to public internal"
#     destination = "0.0.0.0/0"

#   }

#   # TODO: add service gateway
# }