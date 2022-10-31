# terraform

## Background
Managing infra as a code using terraform.

## Objectives
- VPC with two public and private subnets
- Route tables for each subnet
- Security Group to allow port 80 and 443 from the Internet
- ELB - listening on ports 80 & 443
- Public route53 hosted zone and CNAME entry for the ELB

## Project structure
* terraform
* modules
    * security_groups
        * variables.tf
        * main.tf
    * vpc
        * variables.tf
        * main.tf