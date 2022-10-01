resource "tls_private_key" "app_key" {
 algorithm = "ED25519"
}

resource "local_file" "app_private_key" {
  content         = tls_private_key.app_key.private_key_openssh
  filename        = var.app_key_path
  file_permission = "600"
}

