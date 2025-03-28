output "key_name" {
    value = module.ssh-key.key_name
}

output "public_ip" {
    value = module.ec2.public_ip
}

output "private_ip" {
    value = module.ec2.private_ip
}