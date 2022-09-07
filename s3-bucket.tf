
resource "aws_s3_bucket" "dev4" {
  bucket = "hrolim-dev4"
  
  tags = {
    Name = "hrolim-dev4"
  }
}

resource "aws_s3_bucket_acl" "dev4_acl" {
  bucket = aws_s3_bucket.dev4.id
  acl    = "private"
}