#!/bin/bash

kubectl get all
kubectl run myweb-1st-app --image=leeseonhyo817/myweb --port=8080 --generator=run/v1
    // Creat replication-controller(rc) and one-pod
kubectl get all
kubectl get rc
kubectl expose rc myweb-1st-app --type=LoadBalancer --name myweb-svc
    // Create service
kubectl scale rc myweb-1st-app --replicas=3
    // Create Pods (Total 3 pods)
kubectl get all -o wide
curl http://192.168.122.200:8080
    // communication Loadbalancer
curl http://192.168.122.11:32192
    // communication VM(Host)
kubectl get rc myweb-1st-app -o yaml
    // print replication-controller by yaml type