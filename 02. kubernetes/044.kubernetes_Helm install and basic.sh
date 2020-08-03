wget https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz
tar zxf helm-v3.2.4-linux-arm64.tar.gz
cd linux-amd64
sudo cp helm /usr/local/bin
helm version
  # helm이 제대로 설치되었나 확인
helm search hub mysql
  # mysql 차트(helm 패키지) 검색
  # helm hub에 있는 mysql chart 목록 출력
helm repo list
  # 현재 사용중인 저장소가 없기 때문에 error 출력
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo list
  # 방금 추가한 stable 이라는 이름으로 저장된 google repository 저장
helm search repo mysql
  # 저장소를 추가하면 추가된 저장소에서 chart 목록을 가져옴
helm repo update
  # update: 목록을 업데이트 함
  # upgrade version을 업그레이드 함
helm repo add xyz https://kubernetes-charts.storage.googleapis.com
  # stable이라는 이름으로 google 주소에 있는 repogitory를 가져오는 것이고, xyz라고 하면 xyz로 됨
helm show chart stable/mysql
  # helm chart 정보 확인
helm show readme stable/mysql
  # chart에 대한 다양한 정보 확인
helm show values stable/mysql
  # 변수들을 지정할 수 있거나 이미 지정되어 있는 정보를 확인
helm show all stable/mysql
  # 위의 모든 정보를 한번에 확인 가능