# terraform
From my experience building personal projects in the cloud, I have learned that to save time automation is necessary. 
I started with CloudFormation and got into Terraform as a tool for IaC in a multi-cloud environment. It’s so easy to implement your own variables, modules, and infrastructure. 

In this repo:
1) VPC networking module
2) Remote state with S3 implementation (so you don’t have to deal with local state files, state will be stored in s3 and refreshed as soon as changes are made to infrastructure and will be maintained in s3)
3) S3 storage configuration with lifecycle policies and ACL's
4) DynamoDB global table implementation
