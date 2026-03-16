This project demonstrates an end-to-end Internal Developer Platform (IDP) workflow. It integrates Backstage for self-service provisioning, Terraform for cloud infrastructure, and a GitHub Actions pipeline for deploying a FastAPI microservice via Helm to Kubernetes.

## Architecture Overview
- Backstage: Provides the Software Catalog and Scaffolder templates for developers.
- Terraform: Modular code to provision Azure Storage and Resource Groups.
- FastAPI App: A Python service utilizing asynchronous concurrency for external API data retrieval.
- Helm: Manages Kubernetes manifests and environment-specific overrides.
- GitHub Actions: A CI/CD pipeline for automated testing and deployment.

## Project Structure
Each challenge is isolated in its own folder and contains a dedicated README file, as can be seen in the below structure.

### Tree structure

```
.
├── backstage
│   ├── README.md
│   └── template.yaml
├── Docker
│   ├── Dockerfile
│   └── README.md
├── helm
│   └── shop_backend
│       ├── Chart.yaml
│       ├── README.md
│       ├── templates
│       │   ├── _helpers.tpl
│       │   ├── configmap.yaml
│       │   ├── cronjob.yaml
│       │   ├── deployment.yaml
│       │   ├── hpa.yaml
│       │   ├── ingress.yaml
│       │   ├── secret.yaml
│       │   ├── service.yaml
│       │   └── tests
│       │       └── test-connection.yaml
│       ├── values-dev.yaml
│       ├── values-prod.yaml
│       ├── values-stg.yaml
│       ├── values.schema.json
│       └── values.yaml
├── README.md
├── shop_backend
│   ├── app.py
│   ├── README.md
│   └── requirements.txt
└── terraform
    ├── main.tf
    ├── modules
    │   └── azure_storage
    │       ├── main.tf
    │       ├── outputs.tf
    │       └── variables.tf
    ├── outputs.tf
    ├── provider.tf
    ├── README.md
    ├── variables.tf
    └── vars
        └── dev.tfvars
```