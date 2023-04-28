resource "aws_s3_bucket" "dummy-bucket" {
  bucket = "delete-me-bucket-2023-04-27"
}

data "aws_iam_policy_document" "iam_s3_bucket_policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.dummy-bucket.arn}/*",
    ]

    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.dummy_distribution.arn]
    }
  }
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.dummy-bucket.id
  policy = data.aws_iam_policy_document.iam_s3_bucket_policy.json
}

