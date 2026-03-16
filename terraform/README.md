## Terraform Infrastructure
The `hashicorp/azurerm` provider is used to provision the infrastructure in Azure. This is a simple modular Terraform design to create storage accoun infrastructure. It works directly with the Backstage tool, enabling Devs to self-serve infrastructue. There are certain guardrails in the Terraform code which forces users to adhere to naming conventions.

The `variables.tf` file contains certain variables which helps us to have clean code with minimal hardcoded values and ensures reusability across teams. I've also added a `dev.tfvars` file where values are defined, although this is overspec for this project, it is always best-practice to use var files. It is important to reference this file when running `terraform plan` and `terraform apply`.

### Testing Terraform locally
- `cd terraform/`
- `terraform fmt` - Optional, but good for clean Terraform code format
- `terraform init` - Initializes Terraform locally
- `terraform plan -var-file=vars/dev.tfvars -out=tfoutput.txt` - Runs Terraform plan to an output file
