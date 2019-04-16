#!/bin/bash

ls -lrtha
ls -lrtha terraform-state-file
pwd
echo Terraform Statefile name: $terraform_statefile
cp terraform-state-file/$terraform_statefile terraform-template-aws/pivotal-cf-terraforming-aws*/terraforming-pas/terraform.tfstate

cd terraform-template-aws/pivotal-cf-terraforming-aws*/terraforming-pas
pwd
ls -lrtha

echo "Catting Local Satefile:"
cat terraform.tfstate

echo "Executing Terraform Show:"
terraform show

exit 0