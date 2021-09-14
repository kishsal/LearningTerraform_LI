# LearningTerraform_LI

https://www.linkedin.com/learning-login/share?account=104&forceAccount=false&redirect=https%3A%2F%2Fwww.linkedin.com%2Flearning%2Flearning-terraform-2%3Ftrk%3Dshare_ent_url%26shareId%3DIPYgUqLiTHaZHvuPb5RdaA%253D%253D


## Set up AWS
- Create a user called `Terraform`
- Grant AdministratorAccess
- Save AccessID and AccessSecretId

### Configure AWS
- Enter `aws configure` and provide the following details
```
AWS Access Key ID [None]: <AccessKeyId>
AWS Secret Access Key [None]: <SecretAccessKey>
Default region name [None]: us-east-2
Default output format [None]: json
```

### Create a tf file
- Create a folder called `tf_code`
- Create a file called `first_code.tf`
- Enter the specified code and then run `terraform init`, `terraform plan` and then `terraform apply`
- To destroy, type `terraform destroy`


### Graph Viz
- Enter `terraform graph`
- Copy the details:
```
digraph {
        compound = "true"
        newrank = "true"
        subgraph "root" {
                "[root] aws_s3_bucket.tf_course (expand)" [label = "aws_s3_bucket.tf_course", shape = "box"]
                "[root] provider[\"registry.terraform.io/hashicorp/aws\"]" [label = "provider[\"registry.terraform.io/hashicorp/aws\"]", shape = "diamond"]
                "[root] aws_s3_bucket.tf_course (expand)" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"]"
                "[root] meta.count-boundary (EachMode fixup)" -> "[root] aws_s3_bucket.tf_course (expand)"
                "[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)" -> "[root] aws_s3_bucket.tf_course (expand)"
                "[root] root" -> "[root] meta.count-boundary (EachMode fixup)"
                "[root] root" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)"
        }
}
```
- Go to www.webgraphviz.com and then paste the output to generate graph

### Auto-approve
- Instead of typing `yes` to trigger a deploy or deletion, you can just enter the following:
```
terraform apply -auto-approve
```
- This will apply the changes by automatically approving
