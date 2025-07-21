provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "mygracesoamazing20251707" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_tag
    Environment = "Dev"
  }
}

resource "aws_instance" "Threadup" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = var.instance_type
    Environment = "Dev"
  }
}