vi 032.01.mynapp-sts.yml
watch kubectl get po,sts,svc -o wide
kubectl create -f 032.01.mynapp-sts.yml
  # replicas를 2개 설정해서 pod가 2개가 생성되며, serviceName 필수 사항
  # pod의 이름은 순서대로 생성
kubectl scale sts mynapp-sts --replicas=3
  # scale out 수행하면 pod가 1개가 추가되며 이름은 이미 만들어진 pod 뒤의 숫자가 붙어서 생성
kubectl delete po mynapp-sts -1 --grace-period=0 --force
  # pod를 삭제해도 바로 생성되며, 이름도 동일하게 생성
  # 기존에 있던 data도 바로 사용가능
  # 기존에 있던 pod를 복제하기 때문에 접근 경로도 남아있어서 data 사용 가능

vi 032.02.mynapp-sts-vol.yml
watch kubectl get po,sts,svc -o wide
kubectl create -f 032.02.mynapp-sts-vol.yml
  # 동적 불륨을 붙이는 것도 가능
  # spec.volumeClaimTemplates 작성