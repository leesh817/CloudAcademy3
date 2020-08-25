vi ins_replace.tf

terraform fmt       # terraform form 형식 맞춤
terraform init      # 초기화 진행 (공급자와 관련된 플러그인을 다운로드 및 설치 진행)
terraform vaildate  # terraform file 유효성 검증
terraform plan      # 배포 전 시뮬레이션 진행
terraform apply     # 변경사항 적용 및 배포 진행
                    # replace의 경우 instance의 내부 내용이 변경되는 것이 아니라 기존 instance는 terminated되고 새로 생성됨

terraform destroy   # 배포한 instance 및 다양한 service 삭제