variable "VpcName"       { type = string }
variable "VpcCidr"       { type = string }
variable "PublicSubnets"  { type = list(string) }
variable "PrivateSubnets" { type = list(string) }
variable "EnableNatGateway" { type = bool }
