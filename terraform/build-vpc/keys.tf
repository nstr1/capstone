resource "tls_private_key" "jenkins_key" {
 algorithm = "ED25519"
}

resource "tls_private_key" "nexus_key" {
 algorithm = "ED25519"
}

resource "local_file" "jenkins_private_key" {
  content         = tls_private_key.jenkins_key.private_key_openssh
  filename        = var.jenkins_key_path
  file_permission = "600"
}

resource "local_file" "nexus_private_key" {
  content         = tls_private_key.nexus_key.private_key_openssh
  filename        = var.nexus_key_path
  file_permission = "600"
}

