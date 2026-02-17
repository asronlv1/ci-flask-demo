## Overview
This project demonstrates a basic CI pipeline using GitHub Actions to test a Python application and build and push a Docker image.

## Project Structure

```bash
.
├── app/                  # Application source code
├── tests/                # Pytest test cases
├── requirements.txt      # Python dependencies
├── Dockerfile            # Docker image definition
└── .github/
    └── workflows/
        └── ci.yml        # CI pipeline definition
```

## CI Pipeline Flow

1. Trigger
The pipeline runs automatically on every git push.

2. Checkout Code
The pipeline pulls the latest code from the GitHub repository.

3. Setup Python Environment
Python 3.12 is installed to ensure a consistent runtime environment.

4. Install Dependencies
All required Python packages are installed using pip and requirements.txt.

5. Run Tests

Unit tests are executed using pytest.
If any test fails, the pipeline stops and no Docker image is built.

6. Docker Login

The pipeline logs in to Docker Hub using GitHub Secrets:
DOCKER_USERNAME
DOCKER_PASSWORD (or access token)

7. Build and Push Docker Image

A Docker image is built from the project and pushed to Docker Hub.
The image is tagged with the Git commit SHA, ensuring every build is uniquely identifiable.

Example:

```bash
ci-flask-demo:<commit-sha>
```

Why This Approach

Ensures code is tested before building images

Prevents broken code from being deployed

Produces traceable and reproducible Docker images

Keeps CI focused on build and validation only


## Secrets Usage
Docker Hub credentials are stored as GitHub Actions Secrets and are used only during the Docker login step.  
They are not written in the code and are not shown in logs.

## Best Practices

### 1. Why should `kubectl apply` not be used in CI?
CI pipelines should only build and test code. Running `kubectl apply` can change the cluster and cause unexpected deployments.

### 2. Why is `latest` a bad Docker tag?
You cannot be sure which version is running. The tag can change over time and make issues hard to track.

### 3. What is the difference between CI and CD?
CI focuses on building and testing code.  
CD focuses on deploying the code to environments.

### 4. How does this pipeline support GitOps?
All changes start from Git, are tested automatically, and create a Docker image linked to the commit.



