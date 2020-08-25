vi variable_example.tf    # instance 생성 파일
vi variable.tf            # 변수 저장 파일
vi terraform.tfvars       # 변수 저장 파일에서 사용할 변수 입력 파일
vi output.tf              # 배포 이후 화면에 출력할 key 입력

terraform fmt       # terraform form 형식 맞춤
terraform init      # 초기화 진행 (공급자와 관련된 플러그인을 다운로드 및 설치 진행)
terraform vaildate  # terraform file 유효성 검증
terraform plan      # 배포 전 시뮬레이션 진행
terraform apply     # 변경사항 적용 및 배포 진행

terraform destroy   # 배포한 instance 및 다양한 service 삭제