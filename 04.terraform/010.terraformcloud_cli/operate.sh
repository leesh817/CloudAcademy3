vi provider.tf        # instance 생성하는 public cloud 설정
vi instance.tf        # instance 생성 시 필요한 resource 설정
vi variable.tf        # 앞서 작성한 피일들의 변수 특징 선언

terraform login       # terraform cloud -> user settings -> tokens 생성 후 입력
                      # workspace 이름으로 token 생성
vi backend.tf         # cli로 workspace 생성 시 화면에 출력되는 backend.tf 생성

terraform fmt
terraform init
terraform plan
terraform apply       # terraform cloud 내부의 workspace에 tfvars에 입력되는 변수들을 setting

terraform destroy

terraform logout