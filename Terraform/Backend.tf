terraform {
  backend "s3" {
    bucket = "mi-terraform-state-bucket"
    key    = "MiProyectoCloudFirst/terraform.tfstate"
    region = var.AwsRegion
  }
}
