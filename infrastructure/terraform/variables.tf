variable "cloud_id" {
  type    = string
  default = "b1g5ina9qbhqupkm6jb0"
}

variable "folder_id" {
  type    = string
  default = "b1gpib4f01qb1tcrmnlh"
}

variable "token" {
  type    = string
  default = "y0_AgAAAAAzCXKZAATuwQAAAAD3VVVaTU6oBS1bT_Sn-vsyPLyw6r1nIok"
}
variable "zone" {
  type    = string
  default = "ru-central1-a"
}
variable "domain" {
  type    = string
  default = "project-otus.ru"
  description = "DNS domain"
  sensitive = true
}
