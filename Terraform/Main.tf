module "VpcModule" {
  source = "./Modules/Vpc"

  # Pasa aquí las variables necesarias, por ejemplo:
  VpcCidrBlock = var.VpcCidrBlock
  PublicSubnets = var.PublicSubnets
  PrivateSubnets = var.PrivateSubnets
  AvailabilityZones = var.AvailabilityZones
}
