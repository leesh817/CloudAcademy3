mkdir ~/config-practice
cd ~/config-practice
kubectl config --kubeconfig=config-test set-cluster production --server=https://1.2.3.4
kubectl config --kubeconfig=config-test set-cluster development --server=https://5.6.7.8
kubectl config --kubeconfig=config-test set-credentials admin --token=abc
kubectl config --kubeconfig=config-test set-credentials user --token=xyz
kubectl config --kubeconfig=config-test set-context prod-admin --cluster=production --namespace=default --user=admin
kubectl config --kubeconfig=config-test set-context dev-user --cluster=development --namespace=devel --user=user
kubectl config --kubeconfig=config-test view
  # config-test라는 인증 내용을 작성한 부분 확인 가능
  # yaml file 확인 시 cluster, user, context로 나눠져있으며, 명령어로도 생성이 가능함
  # config-practice 디렉토리 내부에 config-test라는 yaml file이 생성되어 있음
  # yaml file 확인 시 명령어로 작성한 내용이 yaml 형태로 작성되어 있는것을 확인할 수 있음
kubectl config view
  # 기본적인 인증 목록이 출력(~/.kube/config)

  # 추가실습
    # ~/.kube/config file 내부에 context -> namespace를 kube-system으로 변경한 뒤 kubectl get all 하면 kube-system에 있는 모든 목록을 출력
    # config file 내부는 기본적인 인증 내용이 만들어지는 것을 확인할 수 있음
    # namespace를 변경해야할 땐 config file을 변경하거나 명령어로 변경하여 사용
    # ex. kubectl config set-context kubernetes-admin@cluster.local --namespace kube-system