data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}  


resource "aws_instance" "my_instance" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    key_name = "terra_key1"
    tags = {
        Name = "First_Terraform_resource_creation"
    } 

}

resource "aws_s3_bucket" "s3_backend" {
  bucket = var.bucket_name
}


resource "aws_s3_bucket_server_side_encryption_configuration" "s3_backend_sse" {
  bucket = aws_s3_bucket.s3_backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     =  "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "s3_backend_versioning" {
  bucket = aws_s3_bucket.s3_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "dynamodb_state_locking" {
  name           = var.dynamodb_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key
  attribute {
    name = var.hash_key
    type = "S"
  }
}

  
