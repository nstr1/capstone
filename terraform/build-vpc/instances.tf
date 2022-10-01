# jenkins instance
module "jenkins-server"{
  source        = "../modules/compute_instance" 
  name          = "nandrusiak-jenkins-server"
  zone          = var.zone
  vpc           = module.build-network.vpc_name
  subnet        = module.build-network.sub1_name
  ephermal_ip   = true
  ssh_pub_key   = tls_private_key.jenkins_key.public_key_openssh
  ssh_user      = var.ssh_user
  machine_type  = "e2-medium"
  tags          = ["jenkins-server"]
}

# jenkins agent
module "jenkins-agent"{
  source        = "../modules/compute_instance" 
  name          = "nandrusiak-jenkins-agent"
  zone          = var.zone
  vpc           = module.build-network.vpc_name
  subnet        = module.build-network.sub1_name
  ephermal_ip   = true
  ssh_pub_key   = tls_private_key.jenkins_key.public_key_openssh
  ssh_user      = var.ssh_user
  machine_type  = "e2-custom-2-5120"
  tags          = ["jenkins-agent"]
}

# nexus instance
module "nexus-server"{
  source        = "../modules/compute_instance" 
  name          = "nandrusiak-nexus-server"
  zone          = var.zone
  vpc           = module.build-network.vpc_name
  subnet        = module.build-network.sub2_name
  ephermal_ip   = true
  ssh_pub_key   = tls_private_key.nexus_key.public_key_openssh
  ssh_user      = var.ssh_user
  machine_type  = "e2-medium"
  tags          = ["nexus-server"]
}

