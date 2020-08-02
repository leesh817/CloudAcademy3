vi 037.01.mynapp-rs-nodename.yml
watch kubectl get po,rs -o wide
kubectl create -f 037.01.mynapp-rs-nodename.yml
  # nodename을 지정하여 특별한 node에 pod를 배치
kubectl scale rs mynapp-rs-nn --replicas=3
  # 설정한 node에 pod가 3개가 생성됨