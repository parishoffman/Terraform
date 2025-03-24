# Terraform

## Description
This project automates the provisioning of a secure AWS infrastructure using Terraform and Packer. It creates a VPC with public and private subnets, security groups, and deploys EC2 instances with pre-configured AMIs built using Packer.

## Architecture Overview
- VPC Configuration: Creates a Virtual Private Cloud with public and private subnets
- Security Groups: Configures appropriate security rules for each instance
- EC2 Instances: Deploys seven EC2 instances (one public, six private)
- Custom AMI: Uses Packer to build an AMI with Docker pre-installed

### 1. Clone repo
```bash
git clone git@github.com:parishoffman/Terraform.git

cd Terraform
```

### 2. Copy AMI_ID and Run Packer 
```bash
# Create config file from template
cp variables.auto.tfvars.example variables.auto.tfvars

# Edit the config file to add ami_id
vim variables.auto.tfvars

# Set up your AWS credentials
aws configure

packer init .

packer build .
```

### 3. Run Terraform
```bash
terraform init

terraform plan

terraform apply
```
When prompted with `Do you want to perform these actions?`, type `yes`. It will continue.

Once complete, it will output the `key_name`, the `private_ip`, and the `public_ip`.

<img width="526" alt="Screenshot 2025-03-24 at 1 56 23 PM" src="https://github.com/user-attachments/assets/7b9018ec-6037-46f3-a0b2-59304e835293" />


### 4. Connect to Public EC2
```bash
# Copy the key_name and public_ip from the outputs before
ssh -i <put key_name here>.pem ec2-user@<put public_ip here>
```
<img width="656" alt="Screenshot 2025-03-24 at 1 58 39 PM" src="https://github.com/user-attachments/assets/952f7c62-99d8-486a-aa0f-8492b7677619" />


### 5. Connect to Private EC2

Once you are in the public EC2, create a pem file
```bash
# For example:
vim private.pem

# Copy over the contents from your previous .pem file into your new .pem file
# Make sure there are no white spaces in your new .pem file
```
Next, you want to change the mode for your new .pem file
```bash
chmod 400 private.pem
```

Now, you are ready to ssh into the private EC2
```bash
# Copy your new .pem file name, and private_ip from the output before
ssh -i <put new .pem file here> ec2-user@<put private_ip here>
```
When prompted `Are you sure you want to continue connecting (yes/no)?`, enter `yes`.

<img width="664" alt="Screenshot 2025-03-24 at 2 00 45 PM" src="https://github.com/user-attachments/assets/43653214-89e2-4590-88d6-341a27086051" />


```bash
# Check docker version
docker -v
```
