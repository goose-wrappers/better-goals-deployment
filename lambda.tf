resource "aws_lambda_function" "lambda_function" {
  function_name = "better-goals"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  runtime       = "nodejs16.x"
}