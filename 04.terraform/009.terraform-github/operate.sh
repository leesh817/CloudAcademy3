vi provider.tf        # instance 생성하는 public cloud 설정
vi instance.tf        # instance 생성 시 필요한 resource 설정
vi variable.tf        # 앞서 작성한 피일들의 변수 특징 선언
vi terraform.tfvars   # 변수의 key, value 작성

terraform fmt
terraform init
terraform plan
terraform apply
terraform destroy

# github 연동
vi .gitignore         # github에 올리지 않을 파일 작성
git remote add origin <https://>
git init
git add .
git commit -m "init"
git push origin master