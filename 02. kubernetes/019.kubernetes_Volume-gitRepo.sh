#!/bin/bash
vi 019.01.mynapp-git-pod.yml
kubectl get po -o wide --show-labels --watch
kubectl create -f 019.01.mynapp-git-pod.yml
kubectl exec mynapp-git-pod -- ls -l /repo