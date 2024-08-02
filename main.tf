// Fetch the most recent Ubuntu 20.04 AMI (Amazon Machine Image) from Canonical
data "aws_ami" "ubuntu" {
  most_recent = true  // Get the most recent AMI
  owners      = ["099720109477"]  // Canonical's AWS account ID
  filter {
    name   = "name" // Filter by name
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"] // Pattern matching for Ubuntu 20.04 AMIs
  }
}

// Define an EC2 module for the application
module "ec2_app" {
   source = "./modules/ec2"  // Path to the EC2 module

   // Pass environment-specific and role-specific variables to the module
   infra_env    = var.infra_env[terraform.workspace]  // Infrastructure environment variable based on the current Terraform workspace
   infra_role   = "app"  // Set the role of the instance as "app"
   instance_size = var.instance_size  // Instance size/type (e.g., t2.micro, t3.medium)
   instance_ami  = data.aws_ami.ubuntu.id  // Use the ID of the most recent Ubuntu 20.04 AMI
}
