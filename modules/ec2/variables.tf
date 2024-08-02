// Specify the environment for the infrastructure (e.g., development, production)
variable "infra_env" {
    type        = string  // Type of the variable (string)
    description = "Specifies the infrastructure environment"  // Description of the variable
}
 
// Specify the role or function of the infrastructure component (e.g., app, database)
variable "infra_role" {
    type        = string  // Type of the variable (string)
    description = "Specifies the purpose or role of the infrastructure"  // Description of the variable
}
 
// Specify the size/type of the EC2 instance (e.g., t2.micro, t3.medium)
variable "instance_size" {
    type        = string  // Type of the variable (string)
    description = "Specifies the EC2 instance size"  // Description of the variable
    default     = "t2.micro"  // Default value for the EC2 instance size
}
 
// Specify the Amazon Machine Image (AMI) to be used for the EC2 instance
variable "instance_ami" {
    type        = string  // Type of the variable (string)
    description = "Specifies the server image (AMI) to use"  // Description of the variable
}
 
// Specify the size of the root block device for the EC2 instance in GB
variable "instance_root_device_size" {
    type        = number  // Type of the variable (number)
    description = "Specifies the root block device size in GB"  // Description of the variable
    default     = 12  // Default size of the root block device
}
