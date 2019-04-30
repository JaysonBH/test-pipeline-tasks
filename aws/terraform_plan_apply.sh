#!/bin/bash

cd terraform-template-aws/pivotal-cf-terraforming-aws*/terraforming-pas
terraform init

ls -l ../../../terraform-state-file/$terraform_statefile
echo "Catting Original state file:"
cat ../../../terraform-state-file/$terraform_statefile
ls -lrtha
echo "availability_zones=$availability_zones" > variable.txt
echo "cating variable.txt"
cat variable.txt

terraform plan -var "env_name"=$env_name -var "access_key"=$access_key -var "secret_key"=$secret_key -var "region"=$region -var "ops_manager_ami"=$ops_manager_ami -var "dns_suffix"=$dns_suffix -out terraform.tfplan -var-file=variable.txt -state=../../../terraform-state-file/$terraform_statefile

terraform apply terraform.tfplan

echo "catting local statefile, if exists"
cat terraform.tfstate
echo "checking original statefile location and size"
ls -lrth ../../../terraform-state-file/
echo "Copying local statefile to updated location"
#cp ../../../terraform-state-file/$terraform_statefile ../../../updated-state-file/$terraform_statefile
cp terraform.tfstate ../../../updated-state-file/$terraform_statefile
echo "Catting updated state file"
cat ../../../updated-state-file/$terraform_statefile
echo "Showing updated state file"
ls -lrth ../../../updated-state-file/

exit 0