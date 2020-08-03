helm repo add elastic https://helm.elastic.co
helm repo update
kubectl create namespace logging
vi 048.01.elastic-value.yml
helm install search elastic/elasticsearch -f elastic-value.yml -n logging
kubectl get all,pv,pvc -n logging
helm list -n logging

vi 048.02.kibana-value.yml
helm install dashboard elastic/kibana -f 048.02.kibana-value.yml -n logging
kubectl get all,pv,pvc -n logging
helm list -n logging

# Error 제거
kubectl run nettool -it --image=c1t1d0s7/network-multitool --generator=run-pod/v1 --rm=true -n logging bash
curl -X DELETE http://elasticsearch-master:9200/.kibana_1
curl -X DELETE http://elasticsearch-master:9200/.kibana_task_manager_1
exit
kubectl delete po -n logging dashboard-XXX --grace-period=0 --force
kubectl -n logging logs -f dashboard-XXX
  # log 확인
  # CPU와 Memory의 사용률 자체가 현재 많아서 error가 발생할 수 있음