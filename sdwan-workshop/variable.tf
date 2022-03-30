variable "location" {
  description = "Resource Group Location"
}

variable "username" {
}

variable "password" {
  default = "fortinet123!"
}

variable "tag" {
  description = "Prefix tag for created ressources"
  type        = string
}

variable "enable_module_output" {
  description = "Enable output from modules"
  type = bool
  default = false
}