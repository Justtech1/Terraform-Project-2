variable "region_name" {
  description = "making region in my provider a variable"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  description = "making my cidr block a variable"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "making my instance tenancy a variable"
  type        = string
  default     = "default"
}

variable "dns_hostnames" {
  description = "making my dns_hostnames a variable"
  type        = bool
  default     = true
}

variable "dns_support" {
  description = "making my dns_support a variable"
  type        = bool
  default     = true
}

variable "Prod-pub-sub1" {
  description = "making my public subnet prod-pub-sub1 a variable"
  type        = string
  default     = "10.0.5.0/24"
}

variable "Prod-pub-sub2" {
  description = "making my public subnet prod-pub-sub2 a variable"
  type        = string
  default     = "10.0.6.0/24"
}

variable "Prod-priv-sub1" {
  description = "making my private subnet prod-priv-sub1 a variable"
  type        = string
  default     = "10.0.7.0/24"
}

variable "Prod-priv-sub2" {
  description = "making my private subnet prod-priv-sub2 a variable"
  type        = string
  default     = "10.0.8.0/24"
}

variable "ami" {
  description = "making my ami a variable in rock-server-1 and rock-server-2"
  type        = string
  default     = "ami-09744628bed84e434"
}

variable "instance_type" {
  description = "making my instance type a variable in rock-server-1 and rock-server-2"
  type        = string
  default     = "t2.micro"
}