resource "aws_s3_bucket" "better_goals_s3" {
  bucket = "better-goals-cdn"
  region = "us-east-1"
}

resource "aws_s3_bucket" "better_goals_canary_results_s3" {
  bucket = "better-goals-canary-results"
  region = "us-east-1"
}
