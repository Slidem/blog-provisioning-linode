terraform {
  backend "s3" {
    bucket = "blog"
    key = "tf-state"
    region = "eu-central-1"
    endpoint = "eu-central-1.linodeobjects.com"
    skip_credentials_validation = true
    access_key = "<linode storage access key>"
    secret_key = "<linode storage secret key>"
  }
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.20.0"
    }
  }
}

provider "linode" {
  token = var.token
}

resource "linode_sshkey" "wordpress_blog_ssh_key" {
  label = var.label
  ssh_key = chomp(file("~/.ssh/blog-instance-linode.pub"))
}

resource "linode_instance" "wordpress_linode" {
  image = var.image
  label = var.label
  region = var.region
  type = var.type
  authorized_keys = [ linode_sshkey.wordpress_blog_ssh_key.ssh_key ]
  root_pass = var.root_pass

  stackscript_id = var.stackscript_id
}