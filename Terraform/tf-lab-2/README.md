# WordPress on AWS with Terraform

## Project Overview
This project demonstrates how to deploy a WordPress application on AWS using Terraform. It provisions the following resources:

- **Custom VPC** with public and private subnets
- **EC2 instance** in a public subnet, serving WordPress
- **RDS MySQL instance** in a private subnet as the WordPress database
- **Security groups** to allow:
  - HTTP (port 80) and SSH (port 22) access to the EC2 instance
  - MySQL (port 3306) access from the EC2 instance to the RDS instance
- **Internet Gateway and routing** to enable internet access for the EC2 instance

**Purpose:** This setup allows a fully functional WordPress site with the database securely isolated in a private subnet. The Terraform code automates infrastructure creation, ensuring a reproducible and manageable deployment.

---

## How to Use

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd <repo-folder>

2. **Initialize Terraform**
    terraform init

3. **Preview the changes**
    terraform plan

4. **Apply the infrastructure**
    terraform apply
    Confirm the apply, and Terraform will provision all resources.

## Verification

### Check EC2 Connectivity
Once the EC2 instance is running, verify that the WordPress application is accessible via its public IP in a web browser.

### Check RDS Connectivity
1. SSH into the EC2 instance:
   ```bash
   ssh -i <keyfile.pem> ec2-user@<ec2-public-ip>

2. Test MySQL connection to the RDS instance:
   ```bash
   nc -vz <rds-endpoint> 3306
   If you see succeeded!, the EC2 instance can communicate with the database.

## Notes
The RDS instance is not publicly accessible; it can only be accessed from within the VPC.

Ensure the security groups allow proper traffic: EC2 for HTTP/SSH, RDS for MySQL from the EC2 security group.

This setup uses user data to install and configure WordPress on the EC2 instance automatically

This keeps headings clear, code blocks distinct, and emphasizes important notes.
