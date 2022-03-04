resource "aws_s3_bucket" "arunkg22bucket2022" {
    bucket = "arunkg22bucket2022"
    # acl = "private"
    force_destroy = true
    # versioning {
    #     enabled = true
    # }
    tags = {
        Name = "statebuck"
    }
} 
resource "aws_dynamodb_table" "terraform_locks_db" {
    name    = "terraform_locks_db"
    hash_key    = "LockID"
    read_capacity   = "8"
    write_capacity  = "8"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name    = "StateLock"
    }
}
