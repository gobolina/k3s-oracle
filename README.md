# k3s-oracle

# oracle pem
mkdir -p ~/.oci
openssl genrsa -out ~/.oci/oracle-cloud.pem 4096
chmod 600 ~/.oci/oracle-cloud.pem
openssl rsa -pubout -in ~/.oci/oracle-cloud.pem -out ~/.oci/oracle-cloud_public.pem


# TODO:
2 subnets? private / public

# list image ids
`oci compute image list --compartment-id "" --operating-system "Canonical Ubuntu" --shape "VM.Standard.A1.Flex"`
