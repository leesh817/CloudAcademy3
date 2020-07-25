vi 015.01.mynapp-readiness-rs.yml
vi 015.02.mynapp-readiness-svc.yml
watch kubectl get po,rs,svc,ep -o wide --show-labels
kubectl create -f 015.01.mynapp-readiness-rs.yml -f 015.02.mynapp-readiness-svc.yml
    # pod의 상태가 running은 되지만 ready가 0임. 
    # command를 오류로 주면 시작이 되지 않고, endpoint가 생성되지 않음
kubectl exec mynapp-rs-readiness-<PodName> -- touch /var/ready
    # command를 직접 실행시켜주면 해당 pod는 ready가 되고 endpoint가 생성됨
kubectl exec mynapp-rs-readiness-<PodName> -- rm /var/ready
    # 파일을 삭제하면 pod의 ready가 0으로 되고 endpoint가 삭제됨
    # loadbalancer를 사용하는 app은 readiness probe를 사용해야함
    # readiness probe는 endpoint와 연관