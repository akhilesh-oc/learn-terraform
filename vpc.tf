
provider "aws" {
    region = "us-west-2"
}

resource "aws_vpc" "first-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "test"
    }
}

resource "aws_subnet" "first-sub1" {
    vpc_id = aws_vpc.first-vpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
      "Name" = "test-sub1"
    }
}
