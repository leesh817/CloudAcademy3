kubectl label node kube-node1 gpu=highend
kubectl label node kube-node2 gpu=midrange
kubectl label node kube-node3 gpu=lowend
kubectl get nodes --show-labels
  # 개별 node에 추가한 label 확인
vi 038.01.mynapp-rs-nodeselector.yml
watch kubectl get po,rs -o wide --show-labels
kubectl create -f 038.01.mynapp-rs-nodeselector.yml
  # 특정 label이 있는 node에 pod 생성 확인
kubectl scale rs mynapp-rs-ns --replicas=3
  # 특정 label이 있는 node에 pod 추가 확인

  # 추가실습
    # kube-node1,2에 동일한 label 작성 후 rs 재생성하면 node에 병렬로 pod가 생성됨
    # scale up 진행하면 동일 개수 pod 생성 확인