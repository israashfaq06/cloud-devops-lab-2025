# Bastion Host (Public Subnet)
resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  associate_public_ip_address = true
  key_name                    = "cloud-devops-lab-2025-key-new" # Replace with your key pair
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
}


# App Server (Private Subnet)
resource "aws_instance" "app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.app.id]
  key_name               = "cloud-devops-lab-2025-key-new" # Replace with your key pair
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
}