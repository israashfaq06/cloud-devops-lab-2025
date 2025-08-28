resource "aws_iam_role" "ec2_role" {
  name = "cloud-devops-lab-2025-dev-isra-ec2-role"
 
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
 
  tags = {
    Name    = "cloud-devops-lab-2025-dev-isra-ec2-role"
    Project = "cloud-devops-lab-2025-isra"
    Env     = "dev"
  }
}
 
resource "aws_iam_role_policy_attachment" "ec2_ssm" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
 
resource "aws_iam_role_policy" "ec2_s3_access" {
  name = "cloud-devops-lab-2025-dev-isra-s3-access"
  role = aws_iam_role.ec2_role.id
 
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::cloud-devops-lab-2025-dev-isra-*",
          "arn:aws:s3:::cloud-devops-lab-2025-dev-isra-*/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy" "ec2_cloudwatch" {
  name = "cloud-devops-lab-2025-dev-isra-cloudwatch"
  role = aws_iam_role.ec2_role.id
 
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "cloudwatch:PutMetricData",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
    ]
  })
}
 
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "cloud-devops-lab-2025-dev-isra-ec2-profile"
  role = aws_iam_role.ec2_role.name
}