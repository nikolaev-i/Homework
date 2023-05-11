variable "base_name" {
  type        = string
  description = "vm based name"
}
variable "vms_subnet_id" {
  type        = string
  description = "subnet id "
}
variable "my_public_ip" {
  type = string
  description = "my public ip"
}


variable "my_password" {
  type        = string
  description = "password"
}
variable "location" {
  type        = string
  description = "azure region"
}