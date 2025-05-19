resource "aws_vpc" "MainVpc" {
  cidr_block = var.VpcCidr
  tags = { Name = var.VpcName }
}

resource "aws_subnet" "Public" {
  for_each               = toset(var.PublicSubnets)
  vpc_id                 = aws_vpc.MainVpc.id
  cidr_block             = each.value
  map_public_ip_on_launch = true
  tags = { Name = "${var.VpcName}-public-${replace(each.value, "/.*/", "")}" }
}

resource "aws_subnet" "Private" {
  for_each   = toset(var.PrivateSubnets)
  vpc_id     = aws_vpc.MainVpc.id
  cidr_block = each.value
  tags = { Name = "${var.VpcName}-private-${replace(each.value, "/.*/", "")}" }
}

module "VpcModule" {
  source            = "./"
  VpcName           = var.VpcName
  VpcCidr           = var.VpcCidr
  PublicSubnets     = var.PublicSubnets
  PrivateSubnets    = var.PrivateSubnets
  EnableNatGateway  = var.EnableNatGateway
}
