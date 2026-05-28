resource "aws_instance" "my_ec2" {
  ami           = "ami-0b4dd9d65556cac22"
  instance_type = "t3.medium"

  subnet_id = data.aws_subnet.existing.id

  tags = {
    Name        = "Terraform-EC2"
    environment = "Sandbox"
  }
}

# Reference existing VPC
data "aws_vpc" "existing" {
  id = "vpc-05596861f4ecffdeb"
}


data "aws_subnet" "existing" {
  id = "subnet-084e70f55ebdba2de"
}

# s3 bucket 
resource "aws_s3_bucket" "my_bucket" {
  bucket = "interns-bucket-testing-1234567890"

  tags = {
    Name        = "MyBucket"
    Environment = "Sandbox"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

