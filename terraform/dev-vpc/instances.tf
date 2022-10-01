# app instance
module "app-server"{
  source        = "../modules/compute_instance" 
  name          = "nandrusiak-app-server"
  zone          = var.zone
  vpc           = module.dev-network.vpc_name
  subnet        = module.dev-network.sub1_name
  ephermal_ip   = true
  ssh_pub_key   = tls_private_key.app_key.public_key_openssh
  ssh_user      = var.ssh_user
  machine_type  = "e2-medium"
  tags          = ["app-server"]
}

# mysql instance
resource "google_sql_database_instance" "sql-server" {
  name                = var.name
  region              = var.region
  database_version    = "MYSQL_5_7"
  deletion_protection = false

  settings {
    tier = "db-f1-micro"

    ip_configuration {

      ipv4_enabled = "true"

      authorized_networks {
        value =	module.app-server.ephermal_ip
      }
    }
  }
}