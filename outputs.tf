output "s3_bucket_name" {
  value       = aws_s3_bucket.mygracesoamazing20251707.id
  description = "Name of the created S3 bucket"
}

output "instance_public_ip" {
  value       = aws_instance.Threadup.public_ip
  description = "Public IP of EC2 instance"
}

output "ec2_instance_id" {
  value = aws_instance.Threadup.id
}