provider "aws" {
  access_key = "AKIA5WFDL3XZPQOBFGI2"
  secret_key = "oujPoDlREMbJjzpM9nQobN+CHuslrPS8kXqkZDvU"
  region     = "us-west-2"  
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "credit-card-details-s3"  
  acl    = "private"             


  tags = {
    Name        = "credit card details s3"
    Environment = "Production"
  }
}
