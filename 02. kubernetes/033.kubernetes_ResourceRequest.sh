vi 033.01.mynapp-pod-req.yml
watch kubectl get po -o wide
watch kubectl top po
  # pod의 cpu 사용량 확인 가능
kubectl creaet -f 033.01.mynapp-pod-req.yml
kubectl describe nodes kube-node
  # pod가 생성된 node를 확인하면 CPU, Memory의 Request가 세팅

vi 033.02.mynapp-pod-huge-req.yml
kubectl create -f 033.02.mynapp-pod-huge-req.yml
kubectl describe mynapp-pod-huge-req
  # Resource 한계치를 넘어서면 pod가 생성되지 못함

vi 033.03.mynapp-pod-limits.yml
watch kubectl top po
kubectl create -f 033.03.mynapp-pod-limits.yml
  # limit 설정한 Resource의 양 확인 가능
kubectl exec -it mynapp-pod-lim -- sha1sum /dev/zero
  # cpu 사용량을 높여서 사용량의 제한이 걸리는지 확인