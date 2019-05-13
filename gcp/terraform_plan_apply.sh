#!/bin/bash

cd terraform-template-gcp/pivotal-cf-terraforming-*/terraforming-pas
terraform init

echo "Original state file Existance:"
ls -l ../../../terraform-state-file/$terraform_statefile

#echo "Copy Existing Statefile to local directory:"
#cp ../../../terraform-state-file/$terraform_statefile terraform.tfstate

echo "availability_zones=$availability_zones" > variable.txt
echo "service_account_key=$service_account_key" >> variable.txt
ls -lrtha
echo "cating variable.txt containing Availability Zones and service account key"
cat variable.txt

#terraform plan -var "env_name"=$env_name -var "access_key"=$access_key -var "secret_key"=$secret_key -var "region"=$region -var "ops_manager_ami"=$ops_manager_ami -var "dns_suffix"=$dns_suffix -out terraform.tfplan -var-file=variable.txt -state=../../../terraform-state-file/$terraform_statefile
terraform plan \
  -var "env_name"=$env_name -var "project"=$project -var "region"=$region \
  -var "dns_suffix"=$dns_suffix -var "opsman_image_url"=$opsman_image_url \
  -var-file=variable.txt -out=terraform.tfplan -state=../../../terraform-state-file/$terraform_statefile

terraform apply terraform.tfplan

echo "catting local statefile, if exists"
cat terraform.tfstate

echo "Copying local statefile to updated location"
cp terraform.tfstate ../../../updated-state-file/$terraform_statefile
# echo "Catting updated state file"
# cat ../../../updated-state-file/$terraform_statefile
echo "Showing updated state file"
ls -lrth ../../../updated-state-file/

exit 0