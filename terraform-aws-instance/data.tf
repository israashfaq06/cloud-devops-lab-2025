data "aws_ami" "ubuntu" {
  # DESCRIPTION: Retrieves the latest Ubuntu AMI dynamically
  # Reasoning: Ensures EC2 instances always use a secure and up-to-date OS image

  most_recent = true
  # Always fetch the latest available image

  owners = ["099720109477"]
  # Canonical account ID for official Ubuntu AMIs
  # Ensures the image is legitimate and trusted

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    # Pattern matches Ubuntu 22.04 HVM SSD images
    # Reasoning: Ensures the right Ubuntu version is selected
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
    # Reasoning: Selects only hardware virtualized images compatible with instance types
  }
}