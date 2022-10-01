output "ephermal_ip" {
  value = var.ephermal_ip == true ? google_compute_instance.compute_instance.network_interface.0.access_config.0.nat_ip : 1
}

output "private_ip" {
  value = google_compute_instance.compute_instance.network_interface.0.network_ip
}
