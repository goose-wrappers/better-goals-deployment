resource "aws_s3_bucket" "better_goals_s3" {
  bucket = "better-goals-cdn"
}

resource "aws_s3_bucket" "better_goals_canary_output_s3" {
  bucket = "better-goals-canary-output"
}
