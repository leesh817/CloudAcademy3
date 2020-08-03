kubectl get namespace
kubectl create ns monitoring
  # 모니터링 도구는 별도의 namespace에 생성 후 패키지 설치 진행
vi 047.01.prometheus-values.yml
helm install monitor stable/prometheus-operator -f 047.01.prometheus-values.yml -n monitoring
  # loadbalancer로 생성하면 ExternalIP가 생성되고 그곳으로 접근하면 web page가 생성됨
  # 개별 node의 monitoring 가능
kubectl get all -n monitoring
  # monitoring namespace에 prometheus-operator에서 설치하는 목록 확인
  # 약 15~20분 소요
kubectl get svc
  # 외부에서 접근 할 Node-port 혹은 LoadBalancer 확인

# prometheus UI의 기능은 별로 없고 개발용으로 사용함
# prometheus UI는 외부에 노출시키지 않음