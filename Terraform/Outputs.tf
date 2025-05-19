output "PublicSubnetIds" {
  value = aws_subnet.Public[*].id
}

output "PrivateSubnetIds" {
  value = aws_subnet.Private[*].id
}
