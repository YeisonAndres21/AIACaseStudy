output "VpcId" {
  description = "ID del VPC creado"
  value       = aws_vpc.MainVpc.id
}

resource "aws_vpc" "MainVpc" {
  cidr_block = var.VpcCidr
  tags = {
    Name = var.VpcName
  }
}

resource "aws_subnet" "Public" {
  for_each             = toset(var.PublicSubnets)
  vpc_id               = aws_vpc.MainVpc.id
  cidr_block           = each.value
  map_public_ip_on_launch = true
  tags = { Name = "${var.VpcName}-public-${replace(each.value, "/.*","")}" }
}

resource "aws_subnet" "Private" {
  for_each   = toset(var.PrivateSubnets)
  vpc_id     = aws_vpc.MainVpc.id
  cidr_block = each.value
  tags = { Name = "${var.VpcName}-private-${replace(each.value, "/.*","")}" }
}

resource "aws_nat_gateway" "NatGw" {
  count         = var.EnableNatGateway ? length(var.PublicSubnets) : 0
  allocation_id = aws_eip.NatEip[count.index].id
  subnet_id     = aws_subnet.Public[count.index].id
}

resource "aws_eip" "NatEip" {
  count = var.EnableNatGateway ? length(var.PublicSubnets) : 0
  vpc   = true
}
