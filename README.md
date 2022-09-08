<h1 align="center">CASE STUDY TERRAFORM AWS</h1> 

<p align="center">This case study, I will be create enviroment in AWS usyng EC2, Security Groups, S3 and DynamoDB.<p>

- Create dynamic EC2 Instances Ubuntu 
- Add access SSH for Instances 
- Create EC2 Instance in another region and usyng the same ssh key 
- Create Bucket S3 and associate a Instance EC2
- Create Database Dynamodb

<img width="482" alt="Screen Shot 2022-09-08 at 11 42 29" src="https://user-images.githubusercontent.com/729786/189152066-3eeab4e9-785f-4915-b557-278d1bf76d6e.png">

## Create AWS account
This <a href="https://aws.amazon.com/pt/premiumsupport/knowledge-center/create-and-activate-aws-account/">link</a> set a tutorial Create AWS Account

## AWS CLI configure
This <a href="https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html">link</a> set a tutorial AWS CLI configure.

## Download TERRAFORM CLI 
This <a href="https://www.terraform.io/downloads">link</a> download Terraform CLI.

## Create Key to SSH access
<code>
cd ~/.ssh 
</code><br />
<code>
ssh-keygen
</code><br />
<code>
Enter file in which to save the key (/home/schacon/.ssh/id_rsa): terraform-aws
</code><br />

In AWS Console, access EC2 Service then in sidebar look for Key pair.
Select Option> Import Key Pair.  

<img width="1079" alt="Screen Shot 2022-09-08 at 11 51 32" src="https://user-images.githubusercontent.com/729786/189154868-f5d6344c-4971-436d-bcbf-5be53b8ed3e3.png">

<code>
cd ~/.ssh && cat terraform-aws.pub
</code>

Import yout public key.
You need repeat this Step in each EC2 Service diferent region 

## VPC / SUBNET / YOUR IP ACCESS
In file .vars.example rename to vars.tf and set your config data.  

## TERRAFORM ( PLAN / APPLY )
Now, in terminal run command <strong>terraform plan</strong>

<img width="353" alt="Screen Shot 2022-09-08 at 12 09 01" src="https://user-images.githubusercontent.com/729786/189158821-6f246960-1b9f-424c-ac76-d4b381fb4f1f.png">

Run <strong>terraform apply</strong>

<img width="624" alt="Screen Shot 2022-09-08 at 12 11 44" src="https://user-images.githubusercontent.com/729786/189159272-1ee8572f-64a5-4155-872f-270382f88d36.png">


## SSH ACCESS EC2
Access your EC2 instance and Connect. 

<img width="531" alt="Screen Shot 2022-09-08 at 12 13 28" src="https://user-images.githubusercontent.com/729786/189159716-7ceb8e1b-12ef-4e97-ad7f-7fd0d5257fd8.png">

This connect SSH example, in your terminal change to

<code>
ssh -i ~/.ssh/terraform-aws ubuntu@ec2-3-23-95-102.us-east-2.compute.amazonaws.com
</code>


( ͡❛ ͜ʖ ͡❛)


Result 

<img width="522" alt="Screen Shot 2022-09-08 at 12 17 05" src="https://user-images.githubusercontent.com/729786/189160558-f7ff6c85-e8db-4e1d-8386-b3cc7a9a9632.png">


## REMEMBER DESTROY YOUR ENVIROMENT IN AWS CLOUD 

Now run command <strong>terraform destroy</strong>
if you don't, you're going to be in trouble. 💸💸💸💸
