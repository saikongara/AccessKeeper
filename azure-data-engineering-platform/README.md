# Azure Data Engineering Authentication Module

This repository contains a reusable Terraform module designed to manage authentication for an Azure Data Engineering Platform. TThe resources included in this project are: 

- Azure Data Lake
- Azure Data Factory
- Azure Databricks
- Azure Service Bus
- Azure Logic Apps
- Azure Log Analytics
- Azure Key Vault
- Azure Cosmos DB. 

## Purpose

The primary purpose of this module is to streamline the authentication process for the specified Azure resources by leveraging Azure Active Directory (AAD) groups. This ensures that the right permissions are assigned to the appropriate groups, facilitating secure access to the data engineering platform.

## Features

- **Role-Based Access Control (RBAC)**: Assigns roles to predefined Azure AD groups for each Azure resource.
- **Modular Design**: Each Azure resource has its own module, promoting reusability and maintainability.
- **Configuration Management**: Supports variable files for easy configuration and customization.

## Prerequisites

- Terraform installed on your machine.
- Azure account with appropriate permissions to create the resources defined in this project.

## Project Structure

The project is organized into modules, each responsible for a specific Azure resource. The structure is as follows:

```
azure-data-engineering-platform
├── modules
│   ├── data_lake
│   ├── data_factory
│   ├── databricks
│   ├── service_bus
│   ├── logic_apps
│   ├── log_analytics
│   ├── key_vault
│   └── cosmos_db
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── README.md
```

## Modules

Each module contains the following files:

- **main.tf**: Contains the Terraform code to create and manage the respective Azure resource.
- **variables.tf**: Defines the input variables for the module, including dummy values and descriptions.
- **outputs.tf**: Specifies the outputs of the module, allowing other modules to reference the created resources.

## Azure AD Groups and Role Assignments

The following Azure AD groups are utilized in this module:

- Engineer_Onshore
- Engineer_Offshore
- Analyst_Onshore
- Analyst_Offshore
- Operations_Onshore
- Operations_Offshore

Each group is assigned specific roles based on their responsibilities within the Azure resources. The roles are defined in the respective module's configuration files.

## Usage

To use this module, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/saikongara/AccessKeeper.git
   cd azure-data-engineering-platform
   ```

2. **Configure Variables**:
   Update the `terraform.tfvars` file with your specific configurations, including storage account names, container names, and any other necessary parameters.

3. **Initialize Terraform**:
   Run the following command to initialize the Terraform configuration:
   ```bash
   terraform init
   ```

4. **Plan the Deployment**:
   Generate an execution plan to see what actions Terraform will take:
   ```bash
   terraform plan
   ```

5. **Apply the Configuration**:
   Deploy the resources by applying the configuration:
   ```bash
   terraform apply
   ```

6. **Destroy the Resources** (if needed):
   To remove all resources created by this project, run:
   ```bash
   terraform destroy
   ```

## Example Configuration

Here is an example of how to configure the `terraform.tfvars` file:

```hcl
resource_group_name = "my-resource-group"
location            = "East US"

role_assignments = {
  "Engineer_Onshore"   = "Contributor"
  "Engineer_Offshore"  = "Contributor"
  "Analyst_Onshore"    = "Reader"
  "Analyst_Offshore"   = "Reader"
  "Operations_Onshore" = "Reader"
  "Operations_Offshore" = "Reader"
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
   cd azure-data-engineering-platform
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

This Terraform module simplifies the management of authentication for an Azure Data Engineering Platform, ensuring that the necessary permissions are correctly assigned to the appropriate Azure AD groups. For further details, refer to the terraform documentation.