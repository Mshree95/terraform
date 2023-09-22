terraform {
  required_version = "~>1.5.7"

  required_providers {
    aws = {
      version = "~> 5.17.0"
  }
}


backend "s3" {
   bucket = "my-s3-bucket-123456897"
   key = "main/terrafom.tfstate"
   region = "us-east-1"
   dynamodb_table = 'dynamodb_state_lockgin_table"
}
}
