terraform {
    required_version = ">= 0.12"
}

# vpc
resource "google_compute_network" "vpc" {
  name = var.vpc_name
  auto_create_subnetworks = false
}

# subnet 1 
resource "google_compute_subnetwork" "subnet1" {
     name                     = var.sub1_name
     ip_cidr_range            = var.sub1_cidr
     network                  = google_compute_network.vpc.name
     private_ip_google_access = var.sub1_private
}

# subnet 2
resource "google_compute_subnetwork" "subnet2" {
     name                     = var.sub2_name
     ip_cidr_range            = var.sub2_cidr
     network                  = google_compute_network.vpc.name
     private_ip_google_access = var.sub2_private
}

