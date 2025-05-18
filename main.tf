provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "meu_bucket" {
  bucket        = "soat-terraform-state-5dc9264c8c230a834fe2a59b744523fd"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versao" {
  bucket = aws_s3_bucket.meu_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.meu_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
