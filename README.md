# Terraform

1. Clone repo
```bash
git clone git@github.com:parishoffman/Terraform.git
```

2. Run Packer and Copy AMI_ID
```bash
packer init .

packer build .

cp variables.auto.tfvars.example variables.auto.tfvars
# Edit your file to add the AMI_ID
# Replace <put AMI_ID here> with the actual AMI_ID 

# Set up AWS credentials by copying over your keys into your config file
```

3. Run Terraform
```bash
terraform init

terraform plan

terraform apply
```
When prompted with `Do you want to perform these actions?`, type `yes`. It will continue.

Once complete, it will output the `key_name`, the `private_ip`, and the `public_ip`.


4. Connect to Public EC2
```bash
# Copy the key_name and public_ip from the outputs before
ssh -i <put key_name here>.pem ec2-user@<put public_ip here>
```

5. Connect to Private EC2
Once you are in the public EC2, create a pem file
```bash
# For example:
vim private.pem

# Copy over the contents from your previous .pem file, into your new .pem file
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


```bash
# Check docker version
docker -v
```
