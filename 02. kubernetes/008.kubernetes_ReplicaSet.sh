kubectl api-resources | grep ReplicaSet
kubectl api-versions | grep apps
vi 008.01.mynapp-rs.yml
kubectl create -f 01_mynapp-rs.yml
kubectl get pods,rs -o wide --show-labels
  # Replica-set, pods, labels, selector 확인
  # pod에는 label이, replicaset에는 selector 작성

vi 008.02.mynapp-rs-exp.yml
kubectl create -f 02_mynapp-rs-exp.yml
kubectl get pods,rs -o wide --show-labels
  # 02 파일에서 지정한 match-expressions 확인
  # rs에서 matchExpressions 지정한 경우 selector에 집합성 기반 레이블이 지정됨
  # pods에는 label이 지정되며, rs에는 selector가 지정되어있음
  # replica-set의 추가적인 기능으로 replica-controller의 쓰임새는 점차 줄어드는 추세