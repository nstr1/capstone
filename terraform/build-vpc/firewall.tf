module "jenkins-server-allow-http" {
  source = "../modules/firewall"  
  name   = "nandrusiak-jenkins-server-allow-http"
  network = module.build-network.vpc_name
  protocol = "tcp"
  ports = ["8080"]
  source_ranges = var.whitelist
  target_tags = ["jenkins-server"]
}

module "nexus-server-allow-http" {
  source = "../modules/firewall"  
  name   = "nandrusiak-nexus-server-allow-http"
  network = module.build-network.vpc_name
  protocol = "tcp"
  ports = ["8081","5000"]
  source_ranges = var.whitelist
  target_tags = ["nexus-server"]
}

module "build-allow-ssh-all" {
  source = "../modules/firewall"  
  name   = "nandrusiak-build-allow-ssh-all"
  network = module.build-network.vpc_name
  protocol = "tcp"
  ports = ["22"]
  source_ranges = var.whitelist
  target_tags = ["nexus-server", "jenkins-server", "jenkins-agent"]
}

module "build-allow-icmp-all" {
  source = "../modules/firewall"  
  name   = "nandrusiak-build-allow-icmp-all"
  network = module.build-network.vpc_name
  protocol = "icmp"
  source_ranges = var.whitelist
  target_tags = ["nexus-server", "jenkins-server", "jenkins-agent"]
}