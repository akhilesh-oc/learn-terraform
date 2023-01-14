resource "aws_vpc" "first-vpc" {
    cidr_block = "11.0.0.0/16"
    tags = {
      "Name" = "test"
    }
}

resource "aws_subnet" "pri-first-sub1" {
    vpc_id = aws_vpc.first-vpc.id
    cidr_block = "11.0.0.0/19"
    availability_zone = "us-west-2a"
    tags = {
      "Name" = "pri-first-sub1"
      # for k8s int loadbalancer
      # "kubernetes.io/role/internal-elb" = "1"
      # for owning the subnets may be
      # "kubernetes.io/cluster/demo" = "owned"
    }
}

resource "aws_subnet" "pri-first-sub2" {
    vpc_id = aws_vpc.first-vpc.id
    cidr_block = "11.0.32.0/19"
    availability_zone = "us-west-2b"
    tags = {
      "Name" = "pri-first-sub2"
      # for k8s int loadbalancer
      # "kubernetes.io/role/internal-elb" = "1"
      # for owning the subnets may be
      # "kubernetes.io/cluster/demo" = "owned"
    }
}
