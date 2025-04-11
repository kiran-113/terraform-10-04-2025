

# output "bucket_arn" {
#   value = aws_s3_bucket.test[*].arn

# }

output "s3_name" {
value = aws_s3_bucket.single.bucket
}

output "s3_arn" {
    value = aws_s3_bucket.single.arn
}

output "s3_names_count"{
    value = aws_s3_bucket.example[*].bucket
}

output "s3_for_each_names" {
    value = [for b in aws_s3_bucket.test : b.bucket]
}

output "s3_for_each_arn" {
    value = [for b in aws_s3_bucket.test : b.arn]
}