terraform {
  backend "s3" {
    bucket = "myapp-tfstate-1234"   # THIS MUST BE HARD CODED
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true # Enable S3 native locking
  }
}