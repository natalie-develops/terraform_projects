provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "my_account" {}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-s3-bucket-${data.aws_caller_identity.my_account.account_id}"
  acl = "public-read"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    prefix = "files/"
    enabled = true

    noncurrent_version_transition {
      days = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 90
    }
  }
  tags = {
    Type="LOG"
    Tier="STANDARD"
  }
}

resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.bucket
  policy = jsonencode({ #Terraform's "jsonencode" function converts a
                        # Terraform expression's result to valid JSON syntax.
    Version: "2012-10-17" #latest aws bucket policy version
    Id: "MyBucketPolicy" #whatever seems good to you
      Statement: [ #statement directive array object to define policy
      {
        Sid: "IPAllow", #name unique to any value to seems relevant
        Effect: "Allow", #what effect will it take on the objects inside the bucket
        Principal: "*", #effected partner, which is everyone
        Action: "s3:*", #they are denied to access s3 objects inside bucket
        Resource: "arn:aws:s3:::${aws_s3_bucket.my_bucket.bucket}/*" #to be granular, provide ARN about bucket
        Condition = {
          IpAddress = {"aws:SourceIp": "4.4.4.4/32"}
        }
      }
     ]
  })
}

resource "aws_s3_bucket_object" "readme_file" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "files/readme.txt"

  source = "readme.txt"
  etag = filemd5("readme.txt")
}