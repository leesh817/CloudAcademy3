kubectl cordon kube-node3
kubectl get nodes
kubectl describe node kube-node3
  # Status 확인하면 SchedulingDisabled로 변경됨
vi 041.01.mynapp-rs-cordon.yml
watch kubectl get po,rs -o wide
kubectl create -f 041.01.mynapp-rs-cordon.yml
  # pod 상태확인하면 node1과 2에 1개씩 생성
kubectl scale rs mynapp-rs-cordon --replicas=6
  # node1과 2에 3개씩 생성
kubectl uncordon kube-node3
kubectl get nodes

kubectl drain kube-node3
  # drain 명령을 실행하면 cordon 실행 후 drain이 실행됨
  # 바로 drain이 실행되지 못하는 이유는 DaemonSet에서 실행중인 pod가 있고, local storage를 사용중인 pod가 존재하기 때문
kubectl drain kube-node3 --ignore-daemonsets --delete-local-data
  # DaemonSet에서 사용중인 pod는 무시하고 local storage의 data는 삭제하라는 옵션을 주면 kube-node3에 있던 pod들의 evcit(퇴거)가 진행
kubectl uncordon kube-node3
  # drain 명령을 실행하면 자동으로 cordon 명령도 실행되기 때문에 모든 작업이 완료된 후 uncordon 진행