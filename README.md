# terraform-github-actions  

## Terraform GitHub Actions CI/CD Project

This project demonstrates how to use **Terraform** and **GitHub Actions** to provision and manage AWS infrastructure using automated CI/CD pipelines. It's intended for learning purposes and covers infrastructure deployment, automation, and safe cleanup.

---

## What This Project Does

Using **Terraform**, this project:

- Provisions an **S3 bucket**
- Launches a **t2.micro EC2 instance** in the `us-east-1` region
- Stores the Terraform state remotely in an **S3 backend** (optional)

These actions are managed and automated via **GitHub Actions workflows**, enabling consistent, repeatable, and secure deployments.

---

## CI/CD & GitHub Actions

- **CI/CD** stands for Continuous Integration and Continuous Deployment. 

- **Continuous Integration [CI]:** Thiis automates the process of building and testing code changes.

- **Continuous Delivery [CD]:** Thiis automates the process of building, testing, and preparation for deployment. Code is ready to be deployed, but not automatically deployed.

- **Continuous Deployment [CD]:** Thiis automates the process of building, testing, and deploying. Every changes that passes automated test is automatically deployed to production.

**In summary:**
- CI focuses on integrating the code changes.
- CDelivery focuses on preparing codes for deployment.
- CDeployment focuses on automating the entire deployment process.

## GitHub Actions

GitHub Actions is a built-in CI/CD tool provided by GitHub that allows you to automate workflows directly in your GitHub repository.

In this project, GitHub Actions ensures that:
- Your Terraform code is validated and applied automatically on push
- Resources can be safely destroyed via a controlled manual workflow

---

## GitHub Actions Workflows

### `terraform.yml` – CI/CD Workflow

Triggered on every push to the main branch, this workflow:

1. Installs the specified version of Terraform
2. Authenticate with AWS credentials using GitHub Secrets
3. Initializes Terraform configuration (`terraform init`)
4. Check the Terraform code for any errors (`terraform fmt -check`)
5. Validates the code (`terraform validate`)
6. Generates a plan of changes (`terraform plan`)
7. Applies the changes (`terraform apply`)

> AWS credentials are securely injected using GitHub Secrets:
> - `AWS_ACCESS_KEY_ID`
> - `AWS_SECRET_ACCESS_KEY`

---

## Secrets Configuration

Set the following GitHub Secrets under:
`GitHub Repo` → `Settings` → `Secrets and variables` → `Actions`

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

---

### `cleanup-terraform.yml` – Destroy Workflow

This manual workflow is used to **clean up all provisioned resources** (to avoid AWS charges).

Steps performed:

1. Initializes Terraform backend
2. Validates configuration
3. Generates a **destroy plan**
4. Applies the plan to **tear down all infrastructure**

---

## How to Trigger the Workflows

### Apply Workflow (`terraform.yml`)

This runs **automatically** when you:

- Push changes to the `main` branch
- Modify any Terraform files

To trigger manually:

1. Go to the **Actions** tab
2. Select **Terraform CI/CD**
3. Click **"Run workflow"** (top right)

---

### Destroy Workflow (`cleanup-terraform.yml`)

To manually destroy all resources:

1. Go to the **Actions** tab
2. Select **Terraform Cleanup**
3. Click **"Run workflow"**
4. Select a branch (usually `main`)
5. Confirm by clicking **Run**

> ⚠️ Warning: This action is irreversible and will delete the EC2 instance and S3 bucket.

---

## Project Folder Structure

```
terraform-cicd/
├── main.tf                           # Infrastructure definition
├── variables.tf                      # Input variables
├── outputs.tf                        # Output values (e.g. public IP, bucket name)
├── .github/
│   └── workflows/
│       └── deploy.terraform.yml      # CI/CD workflow for deploy
│       └── cleanup.terraform.yml     # Manual destroy workflow
├── README.md                         # Project documentation
```

---

## Cleaning Up AWS Resources

After testing:

1. Run the `Terraform Cleanup` workflow to destroy all resources
2. Manually delete the **Terraform backend S3 bucket** if it was created manually

---

## Screenshots

_Add screenshots here of:_
- GitHub Actions workflows running
- Successful `terraform apply` and `destroy`
- AWS Console showing created EC2 instance and S3 bucket


## Success Screenshots

- **GitHub Actions workflows running**

![Working Workflow](https://raw.githubusercontent.com/OrireB/terraform-github-actions/1ba967e5e8b3d64090a7f0a85d2326b7a8d8d0a0/Working%20Workflow.png)

---

- **Successful `terraform apply`**

![Succeful Terraform deploy](https://raw.githubusercontent.com/OrireB/terraform-github-actions/14475561a4181d324937a33881d8353b517b43dd/Succeful%20Terraform%20deploy.png)

---

- **Successful `terraform destroy`**

![Succeful Terraform cleanup](https://raw.githubusercontent.com/OrireB/terraform-github-actions/14475561a4181d324937a33881d8353b517b43dd/Succeful%20Terraform%20cleanup.png)

--- 
