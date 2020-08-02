kubectl describe nodes | grep Taint
  # 개별 node에 설정된 Taint 확인
  # 현재 master node에 설정되어 있으며, 이 때문에 master node에는 pod가 배치되지 않았던 것
  # Taint가 설정되면 그 이후부턴 pod가 배치되지 않으며 이미 생성되어있는 pod에는 옇향을 끼치지 않음
kubectl create -f 039.02.mynapp-rs-affinity-cache.yml -f 039.03.mynapp-rs-affinity-frontend.yml
kubectl get pod
  # cache, frontend pod가 생성되어있는 node 확인
kubectl taint node kube-node1 env=production:Noshcedule
  # 실습 시 pod가 생성되지 않은 node에 taint 설정
vi 040.01.mynapp-rs-notoleration.yml
watch kubectl get po,rs -o wide --show-labels
kubectl create -f 040.01.mynapp-rs-notoleration.yml
  # 새롭게 생성된 pod는 node에 배치되지 못하고 pending 상태가 됨
  # yaml file에 pod anti affinity 설정(이미 생성한 pod와 떨어지게 설정)
  # 또한 taint 설정으로 toleration이 없기 때문에 새로운 pod는 node에 배치되지 못하고 pending 상태
kubectl describe po mynapp-rs-notol-XX
  # Event 확인 시 pod anti affinty와 taint 때문에 node에 배치되지 않는다고 출력

vi 040.02.mynapp-rs-toleration.yml
kubectl create -f 040.02.mynapp-rs-toleration.yml
  # yaml file에 설정한 toleration으로 남은 node에 pod가 배치됨
kubectl scale rs mynapp-rs-tol --replicas=3
  # 동일한 node에 pod가 3개 생성됨
kubectl delete all --all
kubectl taint node kube-node1 env:Noshcedule-
kubectl get nodes | grep Taint
  # taint는 추후 실습을 위해 모두 삭제