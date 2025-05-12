variable "VpcName" {
  description = "Nombre del VPC"
  type        = string
  default     = "CloudFirstVPC"
}

variable "VpcCidr" {
  description = "Rango CIDR para el VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "PublicSubnets" {
  description = "CIDRs de subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}

variable "PrivateSubnets" {
  description = "CIDRs de subredes privadas"
  type        = list(string)
  default     = ["10.0.11.0/24","10.0.12.0/24","10.0.13.0/24"]
}

variable "EnableNatGateway" {
  description = "Crear NAT Gateways"
  type        = bool
  default     = true
}

variable "AwsRegion" {
  description = "Región AWS donde desplegar"
  type        = string
  default     = "us-east-1"
}
