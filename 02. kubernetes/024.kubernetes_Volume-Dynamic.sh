#!/bin/bash
watch kubectl get pv,pvc,po,rs -o wide 
vi 024.01.mynapp-dynamic-pvc.yml
kubectl create -f 024.01.mynapp-dynamic-pvc.yml
  # pvc만 create해도 pv가 자동으로 생성되며 Bound 상태가 되어야 정상작동
vi 024.02.mynapp-dynamic.rs.yml
kubectl create -f 024.02.mynapp-dynamic.rs.yml
  # 정상적으로 생성되면 모든 상태가 running으로 됨
kubectl describe pvc mynapp-dynamic-pvc
  # 어디에 Mount 되었는지 확인 가능