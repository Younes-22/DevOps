# AWS Networking Assignment

This repository documents my AWS networking assignments, where I built a custom VPC with both public and private subnets, configured internet access with Internet Gateway and NAT Gateway, deployed EC2 instances with proper segmentation, and set up an Application Load Balancer (ALB) in front of multiple instances.

---

## Part 1: VPC and Network Setup

**Objective:** Create a custom VPC with both public and private subnets, configure internet access, and deploy EC2 instances with secure segmentation.

### Steps Completed
1. **VPC & Subnets**
   - Created a custom VPC (`10.0.0.0/16`).
   - Added two public subnets (`10.0.0.0/24`, `10.0.1.0/24`) and two private subnets (`10.0.16.0/20`, `10.0.32.0/20`).

2. **Internet Connectivity**
   - Attached an Internet Gateway to the VPC.
   - Created route tables:
     - Public route table → routes `0.0.0.0/0` to IGW.
     - Private route table → routes `0.0.0.0/0` to NAT Gateway.

3. **NAT Gateway**
   - Launched a NAT Gateway in a public subnet with an Elastic IP.
   - Updated private route table to forward traffic through the NAT.

4. **EC2 Instances**
   - Public instance (Amazon Linux 2, Apache installed via user data).
   - Private instance (accessible only via Bastion).

5. **Bastion Host**
   - Deployed in the public subnet to securely SSH into private subnet instances.

---

## Part 2: Application Load Balancer

**Objective:** Deploy an ALB to distribute traffic across two EC2 instances running Apache.

### Steps Completed
1. **EC2 Instances**
   - Launched two EC2 instances in different AZs within the same VPC.
   - Added a user data script to install Apache and serve a custom page with hostname:

   ```bash
   #!/bin/bash
   yum update -y
   yum install -y httpd
   systemctl start httpd
   systemctl enable httpd
   echo "<h1>Hello me from $(hostname -f)</h1>" > /var/www/html/index.html


2. **Security Groups**
- **ALB SG** → Allows inbound HTTP (port 80) from the internet  
- **EC2 SG** → Allows inbound HTTP traffic **only** from the ALB SG  

3. **ALB Setup**
- Internet-facing ALB across two AZs  
- Target group (instances as targets, HTTP health checks)  
- Verified load balancing by accessing the ALB’s DNS name  

---

## Key AWS Services Used
- **VPC** → Isolated virtual network environment for deploying resources  
- **Subnets** → Logical partitions of the VPC (public vs. private for segmentation)  
- **Internet Gateway (IGW)** → Allows resources in public subnets to connect to the internet  
- **NAT Gateway (NGW)** → Allows private subnet instances to access the internet for updates without exposing them directly  
- **EC2** → Compute instances for running Apache web servers and the Bastion host  
- **Security Groups (SGs)** → Virtual firewalls controlling inbound/outbound traffic at the instance and ALB level  
- **Route Tables** → Define routing rules for subnets (IGW for public, NGW for private)  
- **Elastic IP** → Static IP address required for NAT Gateway  
- **Bastion Host** → Jump box to securely access private instances via SSH  
- **Application Load Balancer (ALB)** → Distributes incoming traffic across multiple EC2 instances  
- **Target Groups** → Logical group of backend instances behind the ALB  
- **Health Checks** → Ensure only healthy instances receive traffic  

---

## Notes
- Public instances were accessible directly via their public IPs when HTTP was enabled  
- Private instances could not be reached directly from the internet — access was possible only via the Bastion host  
- Load balancing worked as expected: the ALB’s DNS name routed traffic across both EC2 instances, and unhealthy instances were automatically removed from rotation  
