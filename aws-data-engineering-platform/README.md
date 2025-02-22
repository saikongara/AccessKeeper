# AWS Data Engineering Platform

This project is designed to manage authentication for a Data Engineering Platform using various AWS Data Engineering Platform. The resources included in this project are:

- AWS CloudWatch
- AWS DynamoDB
- AWS EMR
- AWS Glue
- AWS S3
- AWS Secrets Manager
- AWS SQS
- AWS Step Functions
- AWS Lambda

## Purpose

The primary purpose of this project is to streamline the authentication process for the specified AWS resources by leveraging AWS IAM roles and policies. This ensures that the right permissions are assigned to the appropriate roles, facilitating secure access to the data engineering platform.

## Project Structure

The project is organized into modules, each responsible for a specific AWS resource. The structure is as follows:

```
aws-data-engineering-platform
├── modules
│   ├── cloudwatch
│   ├── dynamodb
│   ├── emr
│   ├── glue
│   ├── s3
│   ├── secrets_manager
│   ├── sqs
│   ├── step_functions
│   └── lambda
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── README.md
```

## Features

- **Role-Based Access Control (RBAC)**: Assigns roles to predefined IAM roles for each AWS resource.
- **Modular Design**: Each AWS resource has its own module, promoting reusability and maintainability.
- **Configuration Management**: Supports variable files for easy configuration and customization.

## AWS IAM Roles and Policies

The following IAM roles are utilized in this project:

- DataEngineer
- DataAnalyst
- DataOperations

Each role is assigned specific policies based on their responsibilities within the AWS resources. The policies are defined in the respective module's configuration files.

## Getting Started

### Prerequisites

- Terraform installed on your machine.
- AWS account with appropriate permissions to create the resources defined in this project.

### Configuration

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd aws-data-engineering-platform
   ```

2. **Set up your AWS credentials**:
   Ensure your AWS credentials are configured. You can do this by setting environment variables or using the AWS CLI.

3. **Modify `terraform.tfvars`**:
   Update the `terraform.tfvars` file with your specific values for the variables defined in `variables.tf`.

### Running the Project

1. **Initialize Terraform**:
   Run the following command to initialize the Terraform project:
   ```bash
   terraform init
   ```

2. **Plan the deployment**:
   Generate an execution plan to see what actions Terraform will take:
   ```bash
   terraform plan
   ```

3. **Apply the configuration**:
   Deploy the resources defined in the project:
   ```bash
   terraform apply
   ```

4. **Destroy the resources** (if needed):
   To remove all resources created by this project, run:
   ```bash
   terraform destroy
   ```

## Modules

Each module contains the following files:

- **main.tf**: Contains the Terraform code to create and manage the respective AWS resource.
- **variables.tf**: Defines the input variables for the module, including dummy values and descriptions.
- **outputs.tf**: Specifies the outputs of the module, allowing other modules to reference the created resources.

## Example Usage

To use the modules, you can call them in the `main.tf` file. For example, to create a CloudWatch resource, you would include:

```hcl
module "cloudwatch" {
  source = "./modules/cloudwatch"
  # Pass required variables here
}
```

## Example Configuration

Here is an example of how to configure the `terraform.tfvars` file:

```hcl
resource_group_name = "my-resource-group"
location            = "East US"

role_assignments = {
  "DataEngineer"   = "AdministratorAccess"
  "DataAnalyst"    = "ReadOnlyAccess"
  "DataOperations" = "PowerUserAccess"
}
```

## Outputs

The module provides outputs that can be referenced in other modules or for external use. Check the `outputs.tf` files in each module for available outputs.

## Repository Owner

This repository is maintained by [Sai Kongara](https://github.com/saikongara). For any queries or issues, please contact via [LinkedIn](https://www.linkedin.com/in/nagakongara).

## Contribution

We welcome contributions to enhance this module. To contribute, follow these steps:

1. **Fork the Repository**:
   Click the "Fork" button at the top right of this page to create a copy of this repository in your GitHub account.

2. **Clone Your Fork**:
   ```bash
   git clone <your-fork-url>
   cd aws-data-engineering-platform
   ```

3. **Create a Branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

4. **Make Your Changes**:
   Implement your changes and commit them with a descriptive message.

5. **Push Your Changes**:
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request**:
   Open a pull request from your forked repository to the main repository. Provide a clear description of your changes and the problem they solve.

## Conclusion

This project provides a structured approach to managing AWS resources for a Data Engineering Platform. By using Terraform modules, you can easily manage and scale your infrastructure while maintaining clear organization and documentation.