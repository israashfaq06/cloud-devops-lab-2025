variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"  # Changed from us-east-1 to eu-north-1
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  type        = string
  default     = "10.0.2.0/24"
}

# Add availability zone variable for eu-north-1
variable "availability_zone" {
  description = "Availability zone"
  type        = string
  default     = "eu-north-1"  # Primary AZ for eu-north-1
}

variable "jenkins_admin_password" {
  description = "Jenkins admin password stored securely"
  type        = string
  sensitive   = true
}

variable "jenkins_api_token" {
  description = "Jenkins API token stored securely"
  type        = string
  sensitive   = true
}
