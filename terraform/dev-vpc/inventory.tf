resource "local_file" "dev-hosts" {
  content = templatefile("dev-hosts.tpl",
    {
      app_server_ip = module.app-server.ephermal_ip
      app_key = ".ssh/${basename(var.app_key_path)}"
    }
  )
  filename = var.inventory_path
}