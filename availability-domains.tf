# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domains

# Tenancy is the root or parent to all compartments.
# For this tutorial, use the value of <tenancy-ocid> for the compartment OCID.

data "oci_identity_availability_domains" "ads" {
  compartment_id = oci_identity_compartment.tf-compartment.id
  # compartment_id = "ocid1.tenancy.oc1..aaaaaaaa62gzqfsj4toak2xi7whjnsatkt57gqgzqr3tv2flejwvuiyklaba"
}
