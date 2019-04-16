#!/bin/bash

ls -lrtha
ls -lrtha terraform-state-file
pwd
echo Terraform Statefile name: $terraform_statefile

cd terraform-template-aws/pivotal-cf-terraforming-aws*/terraforming-pas
pwd
cp ../../../terraform-state-file/$terraform_statefile terraform.tfstate
ls -lrtha

echo "Catting Local Satefile:"
cat terraform.tfstate

echo "Executing Terraform Show:"
terraform show

exit 0