vi 035.01.mynapp-quota-cpumem.yml
vi 035.02.mynapp-quota-object.yml
vi 035.03.mynapp-quota-storage.yml
  # 035.01은 CPU, Memory의 사용량 제한
  # 035.02는 object의 사용량을 제한
  # 035.03은 stroage의 크기를 제한
kubectl create -f 035.01.mynapp-quota-cpumem.yml
kubectl create -f 035.02.mynapp-quota-object.yml
kubectl create -f 035.03.mynapp-quota-storage.yml
kubectl get resourcequota
  # 생성한 quota 확인
kubectl describe resourcequota mynapp-quota-cpumem
kubectl describe resourcequota mynapp-quota-object
kubectl describe resourcequota mynapp-quota-storage
  # 현재 사용중인 양과 제한한 양을 모두 확인 가능
kubectl delete resourcequota --all