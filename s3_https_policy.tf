# resource "aws_s3_bucket_policy" "https_policy" {
#   bucket = aws_s3_bucket.my_bucket.id  # Replace with your bucket resource reference

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Sid       = "EnforceHttps",
#         Effect    = "Deny",
#         Principal = "*",
#         Action    = "s3:*",
#         Resource  = "arn:aws:s3:::asd-test-bucket-1/*",
#         Condition = {
#           Bool     = {
#             "aws:SecureTransport": "false"
#           }
#         }
#       }
#     ]
#   })
# }