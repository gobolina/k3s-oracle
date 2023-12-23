module "network" {
    source = "./network"

    compartment_id = oci_identity_compartment.tf-compartment.id
    tenancy_ocid = var.tenancy_ocid

    vpc_cidr = local.vpc_cidr
    public_subnet = local.public_subnet
    private_subnet = local.private_subnet

    whitelist_ips = var.whitelist_ips

    providers = {
      oci = oci
    }

}