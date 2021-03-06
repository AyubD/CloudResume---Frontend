resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.${var.bucket_name}"
  acl = "public-read"
  policy = templatefile("s3policy.json", { bucket = "www.${var.bucket_name}"})

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.$(var.domain_name)"]
    max_age_seconds = 3000
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = var.common_tags
}

resource "aws_s3_bucket" "root_bucket" {
    bucket = var.bucket_name
    acl = "public-read"
    policy = templatefile("s3policy.json", { bucket = var.bucket_name})

    website {
      redirect_all_requests_to = "https://www.$(var.domain_name)"
    }

    tags = var.common_tags
}