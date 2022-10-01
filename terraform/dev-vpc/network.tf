provider "google" {
  credentials = file("../terraform-key.json")

  project = var.project
  region  = var.region
  zone    = var.zone
}

module "dev-network" {
  source = "../modules/network"
  vpc_name = "nandrusiak-dev-vpc"
  
  sub1_name = "app-subnet"
  sub1_cidr = "10.0.0.128/26"

  sub2_name = "mysql-subnet"
  sub2_cidr = "10.0.0.192/26"
}


