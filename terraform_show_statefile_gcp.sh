#!/bin/bash

ls -lrtha
ls -lrtha terraform-state-file
pwd
echo Terraform Statefile name: $terraform_statefile

cd terraform-template-gcp/pivotal-cf-terraforming-*/terraforming-pas
pwd
cp ../../../terraform-state-file/$terraform_statefile terraform.tfstate
ls -lrtha

echo "Catting Local Satefile:"
cat terraform.tfstate

echo "Executing Terraform Show:"
terraform show

exit 0