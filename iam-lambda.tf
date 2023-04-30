data "aws_iam_policy_document" "iam_for_lambda_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "iam_invoke_function_policy" {
  statement {
    effect    = "Allow"
    sid       = "FunctionURLAllowPublicAccess"
    actions   = ["lambda:InvokeFunctionUrl"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "policy_for_lambda" {
  name        = "test-policy"
  description = "A test policy"
  policy      = data.aws_iam_policy_document.iam_invoke_function_policy.json
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.iam_for_lambda_policy.json
}

resource "aws_iam_policy_attachment" "policy_attachment_for_lamda" {
  name       = "invoke_policy_for_lambda"
  roles      = [aws_iam_role.iam_for_lambda.name]
  policy_arn = aws_iam_policy.policy_for_lambda.arn
}