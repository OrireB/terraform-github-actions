terraform {
  backend "s3" {
    bucket  = "mygracesoamazing20251707"
    region  = "us-east-1"
    key     = "s3-github-actions/terraform.tfstate"
    encrypt = true
  }

  required_version = ">= 0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.3" # Pinned to latest stable release (v6.x)
    }
  }
}