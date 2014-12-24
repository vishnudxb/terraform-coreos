terraform-coreos
================

Terraform: Build, Combine, and Launch Infrastructure https://www.terraform.io/

Here I am using Terraform inorder to run the Vegeta docker container in CoreOS in Amazon AWS.

It will launch a c3.xlarge CoreOS AMI in the Singapore Region.

#REQUIREMENTS
* Install Terraform
* You need the AWS ACCESS KEY, AWS SECRET KEY and the KEY PAIR 

#HOW TO RUN THE COMMAND

```
vishnu@server:~# ./terraform apply -var 'access_key=<provide access key>' -var 'secret_key=<provide secret key>' -var 'key_file=<provide your pem file>'

```
