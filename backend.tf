terraform {
  backend "s3" {
    bucket  = "mygracesoamazing20251707"   # Must match exactly the name of the manually created bucket
    region  = "us-east-1"
    key     = "terraform.tfstate"
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