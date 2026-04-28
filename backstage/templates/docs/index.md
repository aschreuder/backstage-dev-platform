# ${{ values.name }}

Owner: ${{ values.team }}

## Overview

This service was generated via Backstage.

## Tech stack

- Language: ${{ values.language }}

## Infrastructure

Postgres enabled: ${{ values.db }}

## Deployment

This service is deployed via Kubernetes using ArgoCD.

## Local development

```bash
# example
docker build -t ${{ values.name }} .
docker run -p 8080:8080 ${{ values.name }}