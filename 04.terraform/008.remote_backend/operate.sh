mkdir remote_backend && cd remote_backend
vi s3_backend.tf
vi dynamodb_lock.tf

terraform fmt       # terraform form 형식 맞춤
terraform init      # 초기화 진행 (공급자와 관련된 플러그인을 다운로드 및 설치 진행)
terraform vaildate  # terraform file 유효성 검증
terraform plan      # 배포 전 시뮬레이션 진행
terraform apply     # 변경사항 적용 및 배포 진행

cd ../
vi instance.tf

terraform fmt       # terraform form 형식 맞춤
terraform init      # 초기화 진행 (공급자와 관련된 플러그인을 다운로드 및 설치 진행)
terraform vaildate  # terraform file 유효성 검증
terraform plan      # 배포 전 시뮬레이션 진행
terraform apply     # 변경사항 적용 및 배포 진행

terraform destroy   # destroy 전 콘솔 내부의 s3 bucket의 내용물 삭제 후 destory 진행해야 resource 삭제 됨