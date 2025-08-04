module "data_bucket" {
  source = "../../modules/data"
  bucket_name = "myapp-tfstate-1234"
  environment = "tfstate"
}

module "keypair" {
  source   = "../../modules/keypair"
  key_name = "my-app-kp"
}