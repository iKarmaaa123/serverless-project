# Serverless Project

## Overview

This project is a serverless system that allows someone to create a user through a create-user api, which is processed and stroed in an S3 bucket to be viewed by a developer. This README outlines step-by-step on how you can get the infrastucture deployed to both `LocalStack` and `AWS`, and go through the whole serverless stack that was used to build this.

## Prequesitis

If you want to follow along with this project walkthrough you will need to have the following

- An AWS Account with an IAM user (do not use the root account) - [Create An Account Here](https://aws.amazon.com/free/?trk=ce1f55b8-6da8-4aa2-af36-3f11e9a449ae&sc_channel=ps&ef_id=Cj0KCQjw782_BhDjARIsABTv_JCWZitQyH0tU_lYElDDQ9HdBabDxB-tKSgYDsRiU0N_XqiVVpjvBTUaAmR7EALw_wcB:G:s&s_kwcid=AL!4422!3!433803621002!e!!g!!aws%20sign%20up!9762827897!98496538743&gclid=Cj0KCQjw782_BhDjARIsABTv_JCWZitQyH0tU_lYElDDQ9HdBabDxB-tKSgYDsRiU0N_XqiVVpjvBTUaAmR7EALw_wcB&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all)

- Terraform - 

- Docker -

- LocalStack CLI -

- Terraform-local -

## Directory Structure of Project

```hcl
.
|-- README.md
|-- envs
|   |-- dev
|   |   |-- dev.tfvars
|   |   |-- main.tf
|   |   |-- variables.tf
|   |   `-- versions.tf
|   `-- prod
|       |-- main.tf
|       |-- prod.tfvars
|       |-- variables.tf
|       `-- versions.tf
`-- modules
    |-- api-gw
    |   |-- api-gw.tf
    |   |-- outputs.tf
    |   `-- variables.tf
    |-- cloudwatch
    |   |-- cloudwatch.tf
    |   |-- outputs.tf
    |   `-- variables.tf
    |-- dynamodb
    |   |-- dynamodb.tf
    |   |-- outputs.tf
    |   `-- variables.tf
    |-- eventbridge
    |   |-- eventbridge.tf
    |   |-- outputs.tf
    |   `-- variables.tf
    |-- iam
    |   |-- iam.tf
    |   |-- outputs.tf
    |   `-- variables.tf
    |-- lambda
    |   |-- archive-files
    |   |   |-- dynamodb_function.zip
    |   |   `-- s3_function.zip
    |   |-- functions
    |   |   |-- __pycache__
    |   |   |   |-- dynamodb.cpython-311.pyc
    |   |   |   `-- s3.cpython-311.pyc
    |   |   |-- dynamodb.py
    |   |   `-- s3.py
    |   |-- lambda.tf
    |   |-- outputs.tf
    |   |-- requirements.txt
    |   |-- tests
    |   |   |-- __pycache__
    |   |   |   |-- test_dynamodb.cpython-311.pyc
    |   |   |   `-- test_s3.cpython-311.pyc
    |   |   |-- test_dynamodb.py
    |   |   `-- test_s3.py
    |   `-- variables.tf
    |-- s3
    |   |-- outputs.tf
    |   |-- s3.tf
    |   `-- variables.tf
    `-- sqs
        |-- outputs.tf
        |-- sqs.tf
        `-- variables.tf
```

## How to run LocalStack

To run LocalStack, make sure you have Docker installed because the CLI pulls a docker image and starts a container that will run the LocalStack application. To start LocalStack, run the following command in a new terminal or with `-d` option to run it in detached mode:

```shell
localstack start
```

When you have ran that command, if it was successful, you should see the following in your terminal:

![alt text](localstack.png)

Click on the endpoint that you see, and you will taken to this page:

![alt text](image.png)

You now have LocalStack set up.

## How to deploy dev and prod

Now that you LocalStack running it is time to deploy the serverless project to both LocalStack and AWS. Go ahead and run the following commands to deploy the infrastructure to LocalStack first:

```shell
cd envs/dev
```

```shell 
tflocal init
```

```shell
tflocal plan -var-file=dev.tfvars
```

```shell
tflocal apply -var-file=prod.tfvars
```
 If you would like to delete your resources, either run tflocal destroy or run the localstack stop command.

 Now we will look at how to deploy to Prod. Go ahead and run the following commands:

 ```shell
cd envs/prod
```

```shell
terraform init (make sure you have the bucket created with the exact name in backend.tf)
```

```shell
terraform plan -var-file=prod.tfvars
```

```shell
terraform apply -var-file=prod.tfvars
```

All resources should successfully be deployed to AWS:

![alt text](terraform-apply.png)

You can also deploy to both dev and prod through GitHub Actions (though you won't be able to access LocalStack through GitHub Actions) through manually running the workflows or making file changes to the Terraform files. If you are going to deploy it through this way, be sure to set up a GitHub environment called `prod` in settings, Environments and and a protection rule where any workflow job referencing this enviornment needs to have a deployment gate that needs to be reviewed and approved by someone - this deployment gate is applied to both the `apply` and `destroy` workflow jobs.