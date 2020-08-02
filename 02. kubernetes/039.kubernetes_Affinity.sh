vi 039.01.mynapp-rs-nodeaffinity.yml
watch kubectl get po,rs -o wide --show-labels
kubectl create -f 039.01.mynapp-rs-nodeaffinity.yml
  # yaml file에 설정한대로 highend, midrange label이 설정된 node에 pod가 1개씩 생성
  # prefer는 선언한 label이 없기 때문에 무시됨
kubectl scale rs mynapp-rs-nodeaff --replicas=6
  # node당 3개씩의 pod가 생성됨

vi 039.02.mynapp-rs-affinity-cache.yml
kubectl create -f 039.02.mynapp-rs-affinity-cache.yml
  # pod anti affinity 설정 (039.02.yaml file로 생성한 pod는 동일한 node에 생성하지 말라는 조건)
  # topologyKey는 node에 설정되어 있는 label을 작성하면 됨
  # pod는 서로 다른 node에 생성되어 있는 것을 확인
kubectl scale rs mynapp-rs-aff-cache --replicas=4
  # 3개의 node에 1개씩 생성되며 1개의 pod는 pending 상태
kubectl scale rs myanpp-rs-aff-cache --replicas=2

vi 039.03.mynapp-rs-affinity-frontend.yml
kubectl create -f 039.03.039.03.mynapp-rs-affinity-frontend.yml
  # 039.03.yaml file의 경우 anti affinity와 affinity 동시 설정
  # 이렇게 동시 설정하는 형태를 실무에선 많이 사용
kubectl scale rs mynapp-rs-aff-front --replicas=3
  # affinity에서 설정한 label이 있는 pod가 2개 뿐이라 추가 생성한 pod는 pending 상태
kubectl scale rs myanpp-rs-aff-cache --replicas=3
  # 개별 node에 cache, frontend label이 있는 pod가 1개씩 생성