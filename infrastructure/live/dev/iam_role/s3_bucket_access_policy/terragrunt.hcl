
terraform {
  source = "tfr:///terraform-aws-modules/iam/aws//modules/iam-policy?version=5.47.1"
}

inputs = {
  name        = "s3-full-access"
  path        = "/"
  description = "IAM policy for full access to the my-dev-environment-bucket bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "BucketFullAccess"
        Effect = "Allow"
        Action = [
          "s3:*"
        ]
        Resource = [
          "arn:aws:s3:::my-dev-environment-bucket",
          "arn:aws:s3:::my-dev-environment-bucket/*"
        ]
      }
    ]
  })
}