terraform {
  required_version = ">= 0.12"
}

resource "google_compute_instance" "compute_instance" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  
  allow_stopping_for_update = true

  tags = var.tags
  
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
      network      = var.vpc
      subnetwork   = var.subnet
      dynamic "access_config"{
        for_each = var.ephermal_ip == false ? [] : [1]
        content {}
    }
  }

  metadata = {
    enable-oslogin = "false"
    ssh-keys = "${var.ssh_user}:${var.ssh_pub_key}"
  }
}