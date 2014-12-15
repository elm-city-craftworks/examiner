require "refile/backend/s3"

aws = {
  access_key_id: ENV["AWS_ACCESS_KEY"],
  secret_access_key: ENV["AWS_SECRET_KEY"],
  bucket: ENV["AWS_BUCKET"],
  max_size: 200.kilobytes
}

Refile.cache = Refile::Backend::S3.new(prefix: "cache", **aws)
Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)
