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
    effect = "Allow"
    sid    = "FunctionURLAllowPublicAccess"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions   = ["lambda:InvokeFunctionUrl"]
    resources = ["*"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.iam_for_lambda_policy.json
}

resource "aws_iam_policy_attachment" "invoke_policy_for_lambda" {
  name       = "invoke_policy_for_lambda"
  roles      = [aws_iam_role.iam_for_lambda.name]
  policy_arn = data.aws_iam_policy_document.iam_invoke_function_policy.json
}