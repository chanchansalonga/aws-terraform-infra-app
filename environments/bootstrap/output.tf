output "tfstate_bucket_name" {
  description = "The name of the Terraform state bucket"
  value       = module.data_bucket.bucket_name
}

output "tfstate_bucket_arn" {
  description = "The ARN of the Terraform state bucket"
  value       = module.data_bucket.bucket_arn
}

output "private_key_pem" {
  value     = module.keypair.private_key_pem
  sensitive = true
}

output "key_name" {
  value = module.keypair.key_name
}