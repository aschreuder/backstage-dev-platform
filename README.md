This project demonstrates an end-to-end Internal Developer Platform (IDP) workflow. It integrates Backstage for self-service provisioning, Terraform for cloud infrastructure, and a GitHub Actions pipeline for deploying the infrastructure automatically.

## Architecture Overview
- Backstage: Provides the Software Catalog and Scaffolder templates for developers.
- Terraform: Modular code to provision AWS resources
- Infra Requests folder: Backstage populates this folder with a yaml file containing database specs.
- GitHub Actions: A CI/CD pipeline for automated testing and deployment.

## Project Structure
Each component is isolated in its own folder and contains a dedicated README file, as can be seen in the below structure.