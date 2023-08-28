resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id  # Replace with your bucket resource reference

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowIAMUserAccess",
        Effect    = "Allow",
        Principal = {
          AWS = aws_iam_user.s3_user.arn,  # ARN of the IAM user
        },
        Action    = "s3:*",
        Resource  = "arn:aws:s3:::asd-test-bucket-1/*",
      },
    ],
  })
}

# resource "aws_s3_bucket_policy" "bucket_policy" {
#   bucket = aws_s3_bucket.my_bucket.id  # Replace with your bucket resource reference

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Sid       = "AllowReadWriteFrom",
#         Effect    = "Allow",
#         Principal = "*",
#         Action    = [
#           "s3:GetObject",
#           "s3:DeleteObject",
#         ],
#         # Resource = "${aws_s3_bucket.my_bucket.arn}/*",
#         Resource = "arn:aws:s3:::asd-test-bucket-1/*",
#         # Condition = {
#         #   "IpAddress": {
#         #     "aws:SourceIp": "82.82.82.82/32"
#         #   }
#         # }
#       },
#       {
#         Sid       = "AllowReadFrom",
#         Effect    = "Allow",
#         Principal = "*",
#         Action    = "s3:GetObject",
#         # Resource  = "${aws_s3_bucket.my_bucket.arn}/*",
#         Resource = "arn:aws:s3:::asd-test-bucket-1/*",
#         # Condition = {
#         #   "IpAddress": {
#         #     "aws:SourceIp": "13.13.0.0/24"
#         #   }
#         # }
#       },
#       {
#         Sid       = "AllowWriteFromInternet",
#         Effect    = "Allow",
#         Principal = "*",
#         Action    = "s3:PutObject",
#         # Resource  = "${aws_s3_bucket.my_bucket.arn}/*",
#         Resource = "arn:aws:s3:::asd-test-bucket-1/*",
#         # Condition = {
#         #   "NotIpAddress": {
#         #     "aws:SourceIp": [
#         #       "82.82.82.82/32",
#         #       "13.13.0.0/24"
#         #     ]
#         #   }
#         # }
#       }
#     ]
#   })
# }