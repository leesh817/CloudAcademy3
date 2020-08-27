vi vpc.tf             # vpc(subnet,gateway,elasticIP,route table,route table association) 생성

terraform init        # terraform plug-in 생성
terraform fmt         # terraform 문법 맞춤
terraform plan        # 생성 전 확인
terraform apply       # aws vpc 생성

terraform destroy     # vpc 제거