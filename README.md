# AccessKeeper

AccessKeeper is a collection of reusable Terraform modules designed to manage authentication for Data Engineering Platforms on both AWS and Azure. The modules incorporate various cloud resources and streamline the authentication process by leveraging IAM roles and policies for AWS, and Azure Active Directory (AAD) groups for Azure.

## Purpose

The primary purpose of AccessKeeper is to ensure that the right permissions are assigned to the appropriate roles or groups, facilitating secure access to the data engineering platforms on AWS and Azure.

## Features

- **Role-Based Access Control (RBAC)**: Assigns roles to predefined IAM roles for AWS and Azure AD groups for Azure.
- **Modular Design**: Each cloud resource has its own module, promoting reusability and maintainability.
- **Configuration Management**: Supports variable files for easy configuration and customization.

## Prerequisites

- Terraform installed on your machine.
- Cloud accounts (AWS and/or Azure) with appropriate permissions to create the resources defined in the modules.

## Project Structure

The project is organized into separate directories for AWS and Azure, each containing modules for specific cloud resources. The structure is as follows:

```
AccessKeeper
├── aws-data-engineering-platform
│   ├── modules
│   │   ├── cloudwatch
│   │   ├── dynamodb
│   │   ├── emr
│   │   ├── glue
│   │   ├── s3
│   │   ├── secrets_manager
│   │   ├── sqs
│   │   ├── step_functions
│   │   └── lambda
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── outputs.tf
│   └── README.md
├── azure-data-engineering-platform
│   ├── modules
│   │   ├── data_lake
│   │   ├── data_factory
│   │   ├── databricks
│   │   ├── service_bus
│   │   ├── logic_apps
│   │   ├── log_analytics
│   │   ├── key_vault
│   │   └── cosmos_db
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── outputs.tf
│   └── README.md
└── README.md
```

## Getting Started

### AWS Data Engineering Platform

For detailed instructions on setting up and using the AWS modules, refer to the [AWS README](./aws-data-engineering-platform/README.md).

### Azure Data Engineering Platform

For detailed instructions on setting up and using the Azure modules, refer to the [Azure README](./azure-data-engineering-platform/README.md).

## Repository Owner

This repository is maintained by [Sai Kongara](https://github.com/saikongara). For any queries or issues, please contact via [LinkedIn](https://www.linkedin.com/in/nagakongara).

## Contribution

We welcome contributions to enhance these modules. To contribute, follow these steps:

1. **Fork the Repository**:
   Click the "Fork" button at the top right of this page to create a copy of this repository in your GitHub account.

2. **Clone Your Fork**:
   ```bash
   git clone <your-fork-url>
   cd AccessKeeper
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

AccessKeeper provides a structured approach to managing cloud resources for Data Engineering Platforms on both AWS and Azure. By using Terraform modules, you can easily manage and scale your infrastructure while maintaining clear organization and documentation.
