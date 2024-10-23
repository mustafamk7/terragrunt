terraform {
  source = "tfr:///terraform-aws-modules/s3-bucket/aws?version=4.2.1"
}

inputs = {
  bucket        = "my-dev-environment-bucket"
  attach_policy           = true
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = [
                "s3:GetObject",
                "s3:PutObject"
            ]
        Resource = "arn:aws:s3:::my-dev-environment-bucket/*"
      }
    ]
  })
  // object_ownership        = "BucketOwnerPreferred"
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  // acl                     = "public-read"

  tags = {
    Environment = "dev"
    Name        = "dev-s3-bucket"
  }
  
}

