
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


# resource "aws_eks_cluster" "demo-cluster" {
#     name = "demo-akhi"
#     role_arn = aws_iam_role.demo-eks-role.arn
# }