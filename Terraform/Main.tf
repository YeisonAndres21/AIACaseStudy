terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = var.AwsRegion
}

module "VpcModule" {
  source         = "./Modules/Vpc"
  VpcName        = var.VpcName
  VpcCidr        = var.VpcCidr
  PublicSubnets  = var.PublicSubnets
  PrivateSubnets = var.PrivateSubnets
}

# aquí van tus outputs, por ejemplo:
output "PublicSubnetIds" {
  value = module.VpcModule.PublicSubnetIds
}
output "PrivateSubnetIds" {
  value = module.VpcModule.PrivateSubnetIds
}  
