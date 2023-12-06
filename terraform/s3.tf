# RESOURCE: S3 BUCKET (INFRA)

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private" # Configuração de ACL atualizada para 'private'
}

resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Removida a configuração aws_s3_bucket_acl pois ela não é mais necessária

resource "aws_s3_bucket_website_configuration" "bucket-website-configuration" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

output "aws_s3_bucket_website_endpoint" {
  value = aws_s3_bucket.bucket.website_endpoint
}

# RESOURCE: S3 BUCKET OBJECTS (APPLICATION)

resource "aws_s3_object" "bucket-objects" {
  bucket       = aws_s3_bucket.bucket.id
  for_each     = fileset("../app/", "*")
  key          = each.value
  source       = "../app/${each.value}"
  acl          = "public-read" # Garantindo que os objetos sejam acessíveis publicamente
  content_type = "text/html"
  etag         = md5(file("../app/${each.value}"))
}
