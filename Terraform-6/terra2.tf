
# Creating a Prod-ci-role

resource "aws_iam_role" "test_role" {
  name = "Prod-ci-role"
 
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# Creating a group called Prod-ci-group and a policy called Prod-ci-policy, and attaching the group to the policy
resource "aws_iam_group" "mygroup" {
  name = "Prod-ci-group"
}

resource "aws_iam_policy" "custompolicy" {
  name        = "Prod-ci-policy"
  policy      =  <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "glacier:InitiateJob",
                "glacier:AbortMultipartUpload",
                "glacier:CreateVault",
                "glacier:ListTagsForVault",
                "glacier:DeleteVault",
                "glacier:DeleteArchive",
                "glacier:ListParts",
                "glacier:DeleteVaultNotifications",
                "glacier:ListJobs",
                "glacier:ListMultipartUploads",
                "glacier:SetVaultNotifications",
                "glacier:CompleteMultipartUpload",
                "glacier:InitiateMultipartUpload",
                "glacier:UploadMultipartPart",
                "glacier:PurchaseProvisionedCapacity",
                "glacier:UploadArchive",
                "glacier:ListVaults",
                "glacier:ListProvisionedCapacity"
            ],
            "Resource": "*"
        }
    ]
}
    EOF
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.mygroup.name
  policy_arn = aws_iam_policy.custompolicy.arn
}

# Creating a user called Prod-ci-user belonging to the above group

resource "aws_iam_user" "myUser" {
    name = "Prod-ci-user"
}

resource "aws_iam_user_group_membership" "example2" {
  user = aws_iam_user.myUser.name

  groups = [
    aws_iam_group.mygroup.name,
  ]
}