module "app-server-allow-http" {
  source = "../modules/firewall"  
  name   = "nandrusiak-app-server-allow-http"
  network = module.dev-network.vpc_name
  protocol = "tcp"
  ports = ["8080"]
  source_ranges = var.whitelist
  target_tags = ["app-server"]
}

module "app-server-allow-ssh" {
  source = "../modules/firewall"  
  name   = "nandrusiak-app-server-allow-ssh"
  network = module.dev-network.vpc_name
  protocol = "tcp"
  ports = ["22"]
  source_ranges = var.whitelist
  target_tags = ["app-server"]
}

module "app-server-allow-icmp" {
  source = "../modules/firewall"  
  name   = "nandrusiak-app-server-allow-icmp"
  network = module.dev-network.vpc_name
  protocol = "icmp"
  source_ranges = var.whitelist
  target_tags = ["app-server"]
}