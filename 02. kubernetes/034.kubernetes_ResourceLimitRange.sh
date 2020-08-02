vi 034.01.mynapp-limitrange.yml
  # pod, container, PVC의 사용범위를 제한하는 yaml file 생성
  # defaultRequest: request
  # default: Limit
  # pod에 설정하면 위의 설정은 무시됨  
  # ex. maxLimitRequestRatio
  # cpu 4 (Request: 10, Limit: 40)
kubectl create -f 034.01.mynapp-limitrange.yml
kubectl get limitranges
kubectl describe limits mynapp-limitrange
  # yaml file에 설정해놓은 Resource limit 확인

vi 034.02.mynapp-pod-no-reqlim.yml
kubectl create -f 034.02.mynapp-pod-no-reqlim.yml
kubectl describe po mynapp-pod-no-reqlim
  # pod yaml file에 limit을 설정하지 않아도 limitrange에서 설정한 수치가 자동으로 적용
  # Limit range보다 크게 limit을 설정하면 pod가 생성되지 않음