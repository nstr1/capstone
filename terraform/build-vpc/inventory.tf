resource "local_file" "build-hosts" {
  content = templatefile("build-hosts.tpl",
    {
      jenkins_server_ip = module.jenkins-server.ephermal_ip
      jenkins_agent_ip = module.jenkins-agent.ephermal_ip
      nexus_server_ip = module.nexus-server.ephermal_ip

      jenkins_key = ".ssh/${basename(var.jenkins_key_path)}"
      nexus_key = ".ssh/${basename(var.nexus_key_path)}"
    }
  )
  filename = var.inventory_path
}
