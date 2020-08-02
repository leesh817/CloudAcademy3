vi 036.01.mynapp-deploy-hpa.yml
watch kubectl get po,deploy,hpa -o wide
kubectl create -f 036.01.mynapp-deploy-hpa.yml
  # pod와 deploy 생성 확인
vi 036.02.mynapp-hpa-cpu.yml
kubectl create -f 036.02.mynapp-hpa-cpu.yml
  # cpu 사용량에 따른 autoscaling 적용하는 yaml file
  # pod, rc, rs 등 사용 가능
kubectl exec mynapp-deploy-hpa-XXX -- sha1sum /dev/zero
  # cpu 사용량이 yaml file에서 설정한 70%가 넘어가면 autoscaling으로 pod 생성