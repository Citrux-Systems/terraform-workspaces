// Create an EC2 instance
resource "aws_instance" "web" {
  ami           = var.instance_ami         // Use the AMI specified in the instance_ami variable
  instance_type = var.instance_size        // Use the instance size/type specified in the instance_size variable
 
  root_block_device {
    volume_size = var.instance_root_device_size  // Set the size of the root block device (in GB)
    volume_type = "gp3"                          // Specify the volume type as gp3 (general-purpose SSD)
  }
 
  // Assign tags to the EC2 instance
  tags = {
    Name        = "server-${var.infra_env}-web"  // Set the name tag using the environment variable
    Role        = var.infra_role                // Assign the role tag based on the infra_role variable
    Project     = "tf-workspace"                // Tag for the project name
    Environment = var.infra_env                 // Tag for the environment (e.g., development, production)
    ManagedBy   = "terraform"                   // Tag indicating that the resource is managed by Terraform
  }
}
