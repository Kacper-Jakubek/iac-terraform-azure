variable "location" {
  type = string
  default = "West Europe"
}

variable "tier" {
  type = string
  default = "Standard"
}

variable "type" {
  type = string
  default = "LRS"
}

variable "env" {
  type = string
  default = "dev"
}

variable "access_type" {
  type = string
  default = "private"
}

variable "blob_type" {
  type = string
  default = "Block"
}