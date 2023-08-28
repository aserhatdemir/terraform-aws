resource "aws_s3_bucket" "my_bucket" {
  bucket = "asd-test-bucket-1"
#   acl    = "private"

  versioning {
    enabled = true
  }
}

# resource "aws_s3_bucket_acl" "my_bucket_acl" {
#   bucket = aws_s3_bucket.my_bucket.id  # Reference the S3 bucket resource

#   grants = [
#     {
#       type        = "CanonicalUser"
#       permissions = ["FULL_CONTROL"]
#       id          = "CanonicalUserId"  # Update this with the appropriate CanonicalUserId
#     },
#   ]
# }