variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "test-bucket"
}

variable "s3_for_each" {
  description = "The name of the S3 bucket for each"
  type        = list(string)
  default     = ["test-bucket-1", "some-bucket-2", "third-s3"]
}

