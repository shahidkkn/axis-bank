
resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id
  tags = {
    public_bucket = true
  }
}

resource "aws_s3_bucket_acl" "newfeature" {
  bucket = aws_s3_bucket.sample.id
  acl = "public-read"
}
