# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

# resource "aws_instance" "web" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"

#   tags = {
#     Name = "Hello"
#   }
# }

#}

resource "random_id" "server" {

  byte_length = 4
}


resource "aws_s3_bucket" "example" {
  count  = 2
  bucket = "${var.bucket_name}-${random_id.server.hex}-${count.index}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "test" {
  for_each = toset(var.s3_for_each)
  bucket   = "${each.value}-${random_id.server.hex}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket" "single" {
  provider = aws.us-west-2
  bucket = "${var.bucket_name}-${random_id.server.hex}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
