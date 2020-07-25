vi 016.01.mynapp-headless-rs.yml
vi 016.02.mynapp-headless-svc.yml
watch kubectl get po,rs,svc,ep -o wide --show-labels
kubectl create -f 016.01.mynapp-headless-rs.yml -f 016.02.mynapp-headless-svc.yml
    # 생성된 service의 ClusterIP가 생성되지 않으며, 하나의 클러스터로 활용할 수 있음(ex. Database
kubectl run nettool -it --image=c1t1d0s7/network-multitool --generator=run-pod/v1 --rm=true bash
nslookup mynapp-rs-headless
    # 3개의 pod가 출력됨