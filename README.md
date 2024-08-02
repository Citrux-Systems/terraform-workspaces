# Terraform EC2 Instance Setup

This project provides Terraform configurations for setting up an EC2 instance in AWS. The configurations are designed to support multiple environments (e.g., development, production) and allow for flexible infrastructure management.

For more detailed information on Terraform and the configurations used in this project, please visit our [blog](https://citruxdigital.com/blog/how-to-manage-multiple-environments-with-terraform-using-workspaces).

## Pre-requisites

- [Terraform](https://www.terraform.io/downloads.html) 1.x or later
- AWS credentials configured with sufficient permissions
- An S3 bucket for storing the Terraform state file
- A DynamoDB table for state locking to prevent concurrent modifications

## Project Structure

- **`main.tf`**: Defines the AWS provider, backend configuration, and module usage.
- **`variables.tf`**: Contains the variable definitions used across the Terraform configuration.
- **`outputs.tf`**: Defines the outputs from the Terraform execution (if any).
- **`modules/ec2`**: Contains the reusable Terraform module for EC2 instance creation.

## Usage

1. **Clone the repository:**

   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```

2. **Initialize the Terraform workspace:**

   ```bash
   terraform init
   ```

3. **Select the environment:**

   Before applying the configuration, ensure you are in the correct Terraform workspace (e.g., `development`, `production`):

   ```bash
   terraform workspace select <environment>
   ```

   If the workspace does not exist, create it:

   ```bash
   terraform workspace new <environment>
   ```

4. **Review and apply the configuration:**

   ```bash
   terraform apply
   ```

   This will show the planned changes and ask for confirmation before applying them.

5. **Destroying the Infrastructure:**

   If you need to tear down the infrastructure, run:

   ```bash
   terraform destroy
   ```

## Backend Configuration

The Terraform state is stored remotely in an S3 bucket and locked using a DynamoDB table. You need to configure these resources with the following settings in your `main.tf`:

- **S3 Bucket**: Specify the name of your S3 bucket for storing the state file.
- **DynamoDB Table**: Specify the name of your DynamoDB table for state locking.
- **Region**: Specify the AWS region where these resources are located.

## Variables

### Required Variables

- **`infra_env`**: Specifies the infrastructure environment (e.g., `development`, `production`).
- **`infra_role`**: Specifies the purpose or role of the infrastructure component.

### Optional Variables

- **`instance_size`**: Specifies the EC2 instance size. Default is `t2.micro`.
- **`instance_ami`**: Specifies the server image (AMI) to use.
- **`instance_root_device_size`**: Specifies the root block device size in GB. Default is `12`.

## Multi-Environment Support

This configuration is designed to work with multiple environments. The `infra_env` variable and Terraform workspaces are used to differentiate between environments like `development` and `production`.
