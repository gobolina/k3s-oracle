module "network" {
    source = "./network"

    compartment_id = oci_identity_compartment.tf-compartment.id
    tenancy_ocid = var.tenancy_ocid

    core_cidr_blocks = local.core_cidr_blocks

    providers = {
      oci = oci
    }

}