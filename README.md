# purpose:
This is CACAO formatted Terraform and Ansible meant to deploy an OFO dev environment to Ubuntu 22.04

## use without CACAO:
```
# obtain and source openrc.sh:
source openrc.sh

# start an ssh-agent:
eval `ssh-agent`
ssh-add ~/.ssh/key

# initialize terraform:
terraform init

# apply the configs:
terraform apply --auto-approve
```
