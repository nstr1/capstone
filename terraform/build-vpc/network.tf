provider "google" {
  credentials = file("../terraform-key.json")

  project = var.project
  region  = var.region
  zone    = var.zone
}

module "build-network" {
  source = "../modules/network"
  vpc_name = "nandrusiak-build-vpc"
  
  sub1_name = "jenkins-subnet"
  sub1_cidr = "10.0.0.0/26"

  sub2_name = "nexus-subnet"
  sub2_cidr = "10.0.0.64/26"
  sub2_private = "true"
}



