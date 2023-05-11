output "vm_public_ip" {
  value = azurerm_public_ip.vm-pip.ip_address
}