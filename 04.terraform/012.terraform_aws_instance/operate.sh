vi provider.tf        # aws cloud 및 사용자 연결
vi vpc.tf             # vpc,subnet(public,private) 생성
vi igw.tf             # internet gateway(route table, route table association) 생성
vi ngw.tf             # NAT gateway(elastic IP, route table, route table association) 생성
vi instance.tf        # instance(public, private) 생성
vi security-group.tf  # security group 생성(모두 개별로 하나씩)
vi keypair.tf         # ssh 접속용 key pair 선언
vi variable.tf        # 변수 정의 및 value 작성
vi terraform.tfvars   # 추가 변수 작성
vi output.tf          # 화면에 출력될 최종 결과물 작성

terraform init        # terraform plug-in 생성
terraform fmt         # terraform 문법 맞춤
terraform plan        # 생성 전 확인
terraform apply       # aws vpc 생성

terraform destroy     # vpc 제거