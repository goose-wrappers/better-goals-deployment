resource "aws_s3_bucket" "better_goals_s3" {
  bucket = "better-goals-cdn"
}

resource "aws_s3_bucket" "better_goals_canary_results_s3" {
  bucket = "better-goals-canary-results"
}
