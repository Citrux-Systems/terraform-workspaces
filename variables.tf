// Define the default AWS region for the infrastructure
variable "default_region" {
    type        = string  // Type of the variable (string)
    description = "The region this infrastructure is in"  // Description of the variable
    default     = "us-west-2"  // Default value for the AWS region
}
 
// Define the instance size/type for the EC2 web server
variable "instance_size" {
    type        = string  // Type of the variable (string)
    description = "EC2 web server size"  // Description of the variable
    default     = "t2.micro"  // Default value for the EC2 instance size
}

// Define environment-specific settings for the infrastructure
variable "infra_env" {
    type    = map(string)  // Type of the variable (map of strings)
    default = { 
        development = "infra-development"  // Value for the development environment
        production  = "infra-production"   // Value for the production environment
    }
}
