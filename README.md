# k3s-oracle

# oracle pem
mkdir -p ~/.oci
openssl genrsa -out ~/.oci/oracle-cloud.pem 4096
chmod 600 ~/.oci/oracle-cloud.pem
openssl rsa -pubout -in ~/.oci/oracle-cloud.pem -out ~/.oci/oracle-cloud_public.pem