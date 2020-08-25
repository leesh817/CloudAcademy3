mkdir -p module/aws-network; cd module/aws-network/
vi vpc.tf           # VPC network 구성 파일 작성
vi variable.tf      # aws-network에 사용할 입력변수 작성
vi output.tf        # 모듈에서 생성된 서브넷 ID 출력

cd ../../; mkdir stage; cd stage
vi stage_main.tf    # stage에서 생성할 instance 구성 파일

terraform fmt       # terraform form 형식 맞춤
terraform init      # 초기화 진행 (공급자와 관련된 플러그인을 다운로드 및 설치 진행)
terraform vaildate  # terraform file 유효성 검증
terraform plan      # 배포 전 시뮬레이션 진행
terraform apply     # 변경사항 적용 및 배포 진행

terraform destroy   # 배포한 instance 및 다양한 service 삭제

cd ../; mkdir prod; cd prod
vi prod_main.tf     # prod에서 생성할 instance 구성 파일

terraform fmt       # terraform form 형식 맞춤
terraform init      # 초기화 진행 (공급자와 관련된 플러그인을 다운로드 및 설치 진행)
terraform vaildate  # terraform file 유효성 검증
terraform plan      # 배포 전 시뮬레이션 진행
terraform apply     # 변경사항 적용 및 배포 진행

terraform destroy   # 배포한 instance 및 다양한 service 삭제