output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "sub1_name" {
  value = google_compute_subnetwork.subnet1.name
}

output "sub2_name" {
  value = google_compute_subnetwork.subnet2.name
}
