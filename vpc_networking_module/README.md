With this project I was able to learn how to read and code against AWS using Terraform HCL language and it’s features to implement an AWS Well-Architected Framework-recommended deployment model for a Virtual Private Cloud.

I implemented access and security rules of my VPC as well as storage using AWS S3 buckets. This VPC features public and private subnets and a single public accessible ec2 instance using an Ubuntu AMI. 

Steps taken to build this module:

<ul>
  <li> step 1: define vpc and it's attributes/variables
  <li> step 2: create public subnets
  <li> step 3: create private subnets
  <li> step 4: creating route tables for public/private routes
  <li> step 5 associate route tables with Subnets
  <li> step 6: (Elastic IP for NAT gateway scalability)
  <li> step 7: create a NAT gateway and add to route table (private resources to connect to internet)
  <li> step 8 creating an internet gateway and adding to route table
  <li> step 9: Implement your EC2 Instance on top of these resources - reusable implementation ubuntu EC2 instances
  <li> step 9: provide variables and execute terraform. extracting key pair and instance type to higher level (module level for reusability)
</ul>
