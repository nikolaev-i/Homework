variable "secret" {
  type        = string
  description = "Secret"
}

variable "id" {
  type        = string
  description = "Client ID"
}

variable "t_id" {
  type        = string
  description = "Tennat id"
}
variable "subscription" {
  type        = string
  description = "Subscription key"
}

variable "my_name" {
  type        = string
  description = "user name for resource creation"
}

variable "enviorment" {
  type = string
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
