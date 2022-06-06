# eks-blueprints-test
Gotta test out eks blueprints, yo!

## Backend Setup
Just created a backend during `terraform init`, then went and set execution mode to "local".

## Usage

```sh
terraform init
terraform plan
terraform apply
aws eks --region us-east-1 update-kubeconfig --name eks-blueprints-test
```