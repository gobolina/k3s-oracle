# variable "compartment_ocid" {}
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_name" {}

variable "availability_domain" {}

variable "my_public_ip_cidr" {}
variable "cluster_name" {}
variable "os_image_id" {}
variable "certmanager_email_address" {}
variable "k3s_server_pool_size" {
  default = 1
}
variable "k3s_worker_pool_size" {
  default = 2
}
variable "k3s_extra_worker_node" {
  default = true
}
variable "expose_kubeapi" {
  default = true
}
variable "environment" {
  default = "staging"
}