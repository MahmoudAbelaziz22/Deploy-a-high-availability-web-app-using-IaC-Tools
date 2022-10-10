variable "region" {
  type = string
  description = "it use to put the region of work"
}


variable "cidr_block" {
  type= string 
  description = "this the cidr block variable"
}


variable "EnvironmentName" {
  type = string
}

variable "publicsubnet1_cidr_block" {
  type= string
}
variable "publicsubnet2_cidr_block" {
  type= string
}
variable "privatesubnet1_cidr_block" {
  type= string
}
variable "privatesubnet2_cidr_block" {
  type= string
}