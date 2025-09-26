root@ip-172-31-19-8:~# cat main.tf
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-venky"  # must be globally unique
  force_destroy = true
}

resource "aws_s3_object" "my_file" {
  bucket = "my-unique-bucket-name-venky"
  key    = "hello.txt"
  source = "/root/hello.txt"

}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}

# after creating s3+dynamodb do apply this
terraform {
  backend "s3" {
    bucket         = "my-unique-bucket-name-venky"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}

resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 60"   # waits 60 seconds
  }
}

