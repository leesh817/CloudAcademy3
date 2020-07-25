kubectl api-resources | grep DaemonSet
kubectl api-versions | grep apps
vi 009.01.mynapp-ds.yml
kubectl get pods,ds,node -o wide --show-labels
	# node 중 'development' label을 가진 node가 없기 때문에 pod가 생성되지 않음
kubectl label nodes kube-node1 node=development
	# node1에 label 추가
kubectl get pods,ds,node -o wide --show-labels
	# 'development' node가 생성되어 해당 node에 pod가 생성됨
kubectl label nodes kube-node1 node='' --overwrite
	# label 삭제
kubectl get pods,ds,node -o wide --show-labels
	# label 삭제 시 pod는 자동으로 삭제됨

vi 009.02.mynapp-ds-nodeselector_delete.yml
kubectl create -f 04_mynapp-ds-nodeselector_delete.yml
kubectl get pods,ds -o wide --show-labels
	# daemonset에 node-selector 지정하지 않으면 개별 node에 pod가 1개씩 생성됨