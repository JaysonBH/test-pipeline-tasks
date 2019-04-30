#!/bin/bash

cd terraform-template-aws/pivotal-cf-terraforming-aws*/terraforming-pas
terraform init

echo "Original state file Existance:"
ls -l ../../../terraform-state-file/$terraform_statefile

echo "Copy Existing Statefile to local directory:"
cp ../../../terraform-state-file/$terraform_statefile terraform.tfstate

echo "availability_zones=$availability_zones" > variable.txt
ls -lrtha
echo "cating variable.txt containing Availability Zones"
cat variable.txt

echo "catting local statefile Before Destroy"
cat terraform.tfstate

terraform destroy -auto-approve -var "env_name"=$env_name -var "access_key"=$access_key -var "secret_key"=$secret_key -var "region"=$region -var "ops_manager_ami"=$ops_manager_ami -var "dns_suffix"=$dns_suffix -var-file=variable.txt -state=terraform.tfstate

echo "Copying local statefile to updated location"
cp terraform.tfstate ../../../updated-state-file/$terraform_statefile
echo "Catting updated state file"
cat ../../../updated-state-file/$terraform_statefile
echo "Showing updated state file"
ls -lrth ../../../updated-state-file/


exit 0