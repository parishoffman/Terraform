resource "random_string" "random" {
  length = 4
  special = false
  upper = false
}

locals {
  key_name = "${var.namespace}-${random_string.random.id}"
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "local_file" "private_key" {
  filename          = "${local.key_name}.pem"
  sensitive_content = tls_private_key.key.private_key_pem
  file_permission   = "0400"
}

resource "aws_key_pair" "key_pair" {
  key_name   = local.key_name
  public_key = tls_private_key.key.public_key_openssh
}