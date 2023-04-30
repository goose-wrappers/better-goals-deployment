# this terraform will create a user that will be used from github actions to upload files to S3

resource "aws_iam_user" "github_actions_iam" {
  name = "github-actions-bot"
}

data "aws_iam_policy_document" "github_actions_policy_document" {
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject", "s3:PutObjectAcl"]
    resources = ["${aws_s3_bucket.dummy-bucket.arn}/*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["iam:PassRole"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "github_actions_policy" {
  name   = "github-actions-policy"
  user   = aws_iam_user.github_actions_iam.name
  policy = data.aws_iam_policy_document.github_actions_policy_document.json
}
