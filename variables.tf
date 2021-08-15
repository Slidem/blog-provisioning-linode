variable "storage-access-key" {
  description = "Linode storage access key. Linode storage used for holding the tf state"
}

variable "storage-secret-key" {
  description = "Linode storage secret key. Linode storage used for holding the tf state"
}

variable "token" {
  description = "Linode API Personal Access Token"
}

variable "label" {
  description = "The Linode's label is for display purposes only."
  default = "wordpress"
}

variable "image" {
  description = "Image to use for Linode instance"
  default = "linode/ubuntu18.04"
}

variable "region" {
  description = "The region where your Linode will be located."
  default = "eu-central"
}

variable "type" {
  description = "Your Linode's plan type."
  default = "g6-nanode-1"
}

variable "root_pass" {
  description = "Linode's root pass"
}

# https://cloud.linode.com/stackscripts/443929
variable "stackscript_id" {
  description = "Stackscript ID"
  default = "443929"
}

variable "stackscript_data" {
  description = "Map of required StackScript UDF data."
  type = map
}