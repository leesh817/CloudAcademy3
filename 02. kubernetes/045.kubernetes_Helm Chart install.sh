helm install mydb stable/mysql
  # mydb: release 이름
  # Namespace: 따로 지정하지 않으면 default에 저장됨
  # Revision에 따라 roll-back도 가능함
  # Note: 개발자가 작성한 사용법
    # jsonpath: etcd에 저장되는 계층적 구조로 작성된 것. jsonpath를 이용하면 필요한 line만 출력할 수 있음
    # kubectl get secret --namespace default mydb-mysql -o jsonpath="{.data.mysql-root-password}" | base64 --decode; echo
      # 설정된 root password 확인 가능
  # storageclass default 설정
  # kubectl patch storageclass rook-cephfs -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
helm list
  # install 진행 시 download한 chart 목록 출력
kubectl get all
kubectl get pv,pvc
  # install을 했기 때문에 바로 생성
helm status mydb
helm uninstall mydb
  # 삭제 시 모든 리소스는 삭제됨(pod,pv,pvc,list 등)

helm show values stable/mysql
echo "mysqlRootPassword: P@ssw0rd" > custom.yaml
helm install mydb-custom stable/mysql --values custom.yaml
  # 필요한 설정이 있는 파일을 직접 지정해서 mydb-custom 생성
  # values 옵션은 kubectl create의 -f 옵션과 동일한 작업 수행
kubectl run nettool -it --image=c1t1d0s7/network-multitool --generator=run-pod/v1 --rm=true bash
mysql -h mydb-custom-mysql -u root -p
P@ssw0rd
  # 변경된 Password로 접근 가능한지 확인
kubectl get secret --namespace default mydb-custom-mysql -o jsonpath="{.data.mysql-root-password}" | base64 --decode; echo
  # root password 변경되어있는지 확인

helm install mydb-3307 stable/mysql --set service.port=3307
  # kubectl get svc 하면 service port가 3307로 변경되서 적용됨
  # yaml file로 작성 시 직접 계층적 구조로 작성해야 하며, 단일 문장으로 적용 시 . 으로 구분
  # set 옵션은 단일문장으로 작성 시, 개발할 때 test 시 사용가능한 옵션

helm uninstall mydb-3307