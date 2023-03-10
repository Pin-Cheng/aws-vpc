variable "region" {
 default = "us-east-1"
}

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.20.4.0/24", "10.20.5.0/24", "10.20.6.0/24"]
}

variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}