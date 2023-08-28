resource "aws_iam_user" "s3_user" {
  name = "s3-user"
}

  resource "aws_iam_access_key" "s3_user_access_key" {
  user = aws_iam_user.s3_user.name
}

  output "s3_user_secret_access_key" {
  value = aws_iam_access_key.s3_user_access_key.secret
  sensitive = true
}

resource "aws_iam_policy_attachment" "s3_user_policy_attachment" {
  name       = "S3UserPolicyAttachment"
  users      = [aws_iam_user.s3_user.name]
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "S3AccessPolicy"
  description = "Policy for S3 bucket access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:DeleteObject",
        ],
        Effect   = "Allow",
        Resource = [
          "arn:aws:s3:::asd-test-bucket-1/*",  # Replace with your bucket name
        ],
        # Condition = {
        #   IpAddress : {
        #     "aws:SourceIp": "82.82.82.82/32"
        #   }
        # }
      },
      {
        Action = [
          "s3:GetObject",
        ],
        Effect   = "Allow",
        Resource = [
          "arn:aws:s3:::asd-test-bucket-1/*",  # Replace with your bucket name
        ],
        # Condition = {
        #   IpAddress : {
        #     "aws:SourceIp": "13.13.0.0/24"
        #   }
        # }
      },
      {
        Action = [
          "s3:PutObject",
        ],
        Effect   = "Allow",
        Resource = [
          "arn:aws:s3:::asd-test-bucket-1/*",  # Replace with your bucket name
        ],
        # Condition = {
        #   NotIpAddress : {
        #     "aws:SourceIp": [
        #       "82.82.82.82/32",
        #       "13.13.0.0/24"
        #     ]
        #   }
        # }
      },
    ],
  })
}