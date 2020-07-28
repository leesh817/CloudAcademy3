vi 027.01.mynapp-env-pod.yml
watch kubectl get po -o wide
kubectl create -f 03_mynapp-pod-env.yml
kubectl port-forward mynapp-pod-env 8088:8088
curl localhost:8088
  # yaml file에 환경변수로 NODE_PORT 선언 후 제작하면 접근이 가능함
  # 추가적 실습 (Dockerfile에서 8080-8090으로 설정했지만 다른 port 번호를 open해도 가능할지)
  # yaml 파일에 8088을 9000으로 모두 바꾸고 create해서 접근했을때 가능했음
  # 따라서 위에서 설명한 EXPOSE는 추후 개발자한테 알려주는 역할이고 실제로는 다른 port 번호를 open해서 연결만 할 수 있으면 상관 없음
  # yaml 파일에서 env를 모두 제거 후 접근은 불가능. (env에서 설정하는 변수가 NODE_PORT인데 NODE_PORT가 열리지 않는듯)
  # 포트 번호를 무조건 선언해줘야 하고 굳이 Dockerfile에 작성된 EXPOSE 범위내로 선언하지 않아도 됨