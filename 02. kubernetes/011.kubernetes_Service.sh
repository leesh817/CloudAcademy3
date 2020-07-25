kubectl api-resources | grep service
kubectl explain svc
vi 011.01.mynapp-svc.yml
kubectl create -f 011.01.mynapp-svc.yml
watch kubectl get po,svc,endpoints -o wide --show-labels
  # file에서 지정한 label을 가진 pod가 없으므로 service의 endpoint가 생성되지 않음
kubectl create -f 008.01.mynapp-rs.yml
  # 기존에 만들었던 replica-set의 label이 service에서 원하는 label과 동일하게 설정되어있으므로 pod 생성 시 endpoint 생성
kubectl run nettool -it --image=c1t1d0s7/network-multitool --generator=run-pod/v1 --rm=true bash
  # 네트워크 확인용 pod 생성
  # generator는 pod 생성 옵션, rm=ture는 종료 시 삭제 옵션
curl 10.233.40.111:80
  # service의 clusertIP, Port로 접속 시 loadbalancing되며 pod에 접근
kubectl scale rs mynapp-rs --replicas=6
  # replica 증가 시 pod 증가하며 endpoint도 증가함
kubectl delete rs mynapp-rs
  # replica-set 삭제 시 endpoint도 삭제

vi 011.02.mynapp-svc-session_affinity.yml
watch kubectl get pods,rs,svc,ep -o wide --show-labels
kubectl create -f 008.01.mynapp-rs.yml
kubectl create -f 011.02.mynapp-svc-session_affinity.yml
  # service, replica-set 생성 시 endpoint 자동 할당
curl 10.233.37.192
  # service의 clusterIP, Port로 접근 시 한번 연결되면 load balancing 불가.
kubectl run nettool -it --image=c1t1d0s7/network-multitool --generator=run-pod/v1 --rm=true bash
curl 10.233.37.192
  # 위에서 연결된 pod와 다른 pod로 연결되며 한번 연결되면 다른곳으로 연결 불가.

vi 011.03.mynapp-namedport-rs.yml
vi 011.04.mynapp-namedport-svc.yml
watch kubectl get pods,rs,svc,ep -o wide --show-labels
kubectl create -f 13_mynapp-named-port-rs.yml -f 14_mynapp-named-port-svc.yml
  # endpoint가 file 내부의 조건대로 생성
  # port에 이름을 지정했으니 지정된 포트로 endpoint가 생성
kubectl edit rs mynapp-naport-rs
  # containerPort 8080 -> 8081 변경
  # Replica-set에서 container port를 변경해도 이름으로 지정했으니 서비스 파일 변경하지 않아도 endpoint 변경됨
kubectl delete pods -l app=mynapp-naport-rs
  # 그러나 새로운 pod에서만 적용이 되고 기존 pod에는 적용되지 않아서 기존 pod 지우고 확인
kubectl replace -f 13_mynapp-named-port-rs.yml
kubectl delete pods -l app=mynapp-naport-rs
  # 다시 8080포트로 원상복구