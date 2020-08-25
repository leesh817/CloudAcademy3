# OS: Ubuntu 18.04 LTS

# 사용할 public cloud: AWS
# IAM 사용자 및 그룹 생성
# Access Key 및 Password scv 파일로 저장

# terraform install
sudo apt install awscli
aws configure
  # Access Key ID
  # Access Key Password
  # region
  # output format
wget https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip
unzip terraform_0.13.0_linux_amd64.zip
sudo cp terraform /usr/local/bin/

# ansible 실습을 위한 package install
sudo apt-get update
sudo apt-get install apt-transport-https wget gnupg
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible