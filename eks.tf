
resource "aws_iam_role" "demo-role" {
  name = "eks-demo-role"
  assume_role_policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "eks.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
    }
POLICY
}

resource "aws_iam_role_policy_attachment" "demo-cluster-POLICY" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.demo-role.name
}

resource "aws_eks_cluster" "demo-akhi" {
    name = "demo-akhi"
    role_arn = aws_iam_role.demo-role.arn
    depends_on = [
      aws_iam_role.demo-role
    ]
    vpc_config {
      subnet_ids = [aws_subnet.pri-first-sub1.id, aws_subnet.pri-first-sub2.id]
    }
}