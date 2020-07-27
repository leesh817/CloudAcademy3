#!/bin/bash
vi 018.01.mynapp-emptydir-rs.yml
vi 018.02.mynapp-emptydir-svc.yml
watch kubectl get po,rs,svc -o wide --show-labels
kubectl create -f 018.01.mynapp-emptydir-rs.yml -f 018.02.mynapp-emptydir-svc.yml
kubectl run nettool -it --image=c1t1d0s7/network-multitool --generator=run-pod/v1 --rm=true bash
curl mynapp-fortune-svc
  # 정상적으로 설치되었으면 다양한 문구들이 출력됨
exit