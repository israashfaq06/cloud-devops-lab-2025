# Store Jenkins Admin Password
resource "aws_ssm_parameter" "jenkins_admin_password" {
  name        = "/cloud-devops-lab-2025-isra/dev/jenkins/admin-password"
  description = "Jenkins admin password"
  type        = "SecureString"
  value       = var.jenkins_admin_password   # stored in variables, not hardcoded

  tags = {
    Name    = "cloud-devops-lab-2025-dev-isra-jenkins-admin-password"
    Project = "cloud-devops-lab-2025-isra"
    Env     = "dev"
  }
}

# Store Jenkins API Token
resource "aws_ssm_parameter" "jenkins_api_token" {
  name        = "/cloud-devops-lab-2025-isra/dev/jenkins/api-token"
  description = "Jenkins API token"
  type        = "SecureString"
  value       = var.jenkins_api_token   # also comes from variable

  tags = {
    Name    = "cloud-devops-lab-2025-dev-isra-jenkins-api-token"
    Project = "cloud-devops-lab-2025-isra"
    Env     = "dev"
  }
}
