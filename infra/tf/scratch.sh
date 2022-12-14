#!/bin/bash

terraform init
terraform plan
terraform apply

terraform apply -target=module.vpc