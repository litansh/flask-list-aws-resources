---
# flask-list-aws-resources

## AWS Infrastructure as Code
Written terraform files and modules to provision:
- VPC with two public and private subnets
- Route tables for each subnet
- Security Group to allow port 80 and 443 from the Internet
- ELB - listening on ports 80 & 443
- Public route53 hosted zone and CNAME entry for the ELB

## AWS API
Created a script in Python to present a list EC2, RDS, Security-Groups and EBS services per region.

## Run it
- Clone the repository
- run `docker compose up -d`
- A flask framework will run a python script and present a list of the above services.
- Go to https://localhost:5001

## Future steps
- Revisit the option to list all of the used AWS resources.
- Add services functions, prefer consolidation.
- Create an EC2 deployment as part of the terraform provisioning and run the application on it using ansible, thus creating an end-to-end deployment solution.
