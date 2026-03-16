## CI/CD
This pipeline automates the build and deployment of the shop_backend service across multiple environments using Docker, Helm, and Kubernetes. It is designed following the Build Once, Deploy Many principle to ensure consistency across the software development lifecycle.

### Multi-Environment Deployment
The pipeline follows a promotional workflow rather than a parallel one. This ensures that code is validated in lower environments before reaching production:
- `dev` (Development)
- `stg` (Staging)  
- `prod` (Production)

Each environment is isolated in its own Kubernetes namespace.

## Pipeline Stages

- Build: Builds Docker image (tagged with Git SHA) and pushes to registry.
- Deploy: Uses a reusable action to run `helm upgrade --install`.
- Verify: Checks `kubectl rollout status` to confirm health.
- Rollback: Automatically reverts to the previous Helm release on failure.

### Required GitHub Secrets

The pipeline requires the following secrets to be configured in GitHub:

- `REGISTRY_URL` - Container registry URL
- `REGISTRY_USERNAME` - Registry authentication username
- `REGISTRY_PASSWORD` - Registry authentication password
- `KUBE_CONFIG` - Base64-encoded Kubernetes configuration file for cluster access

Configure in: `Settings > Secrets and variables > Actions`

## Triggering the Pipeline

The pipeline runs automatically on every push to the `main` branch, deploying to all three environments simultaneously.

### Environment-Specific Configuration

Each environment uses its own values file:
- `helm/shop_backend/values-dev.yaml`
- `helm/shop_backend/values-stg.yaml`
- `helm/shop_backend/values-prod.yaml`

These files should contain environment-specific settings such as replica counts, resource limits, and HPA configurations.
