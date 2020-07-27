ssh student@kube-node1
sudo mkdir /web_contents
echo "Hello hostPath Volumes" | sudo tee /web_contents/index.html
exit
vi 020.01.mynapp-hostPath-rs.yml
vi 020.02.mynapp-hostPath-svc.yml
watch kubectl get po,svc,rs,ep -o wide --show-labels
kubectl create -f 020.01.mynapp-hostPath-rs.yml -f 020.02.mynapp-hostPath-svc.yml
  # rs로 인해 pod가 개별 node마다 하나씩 생성되지만 /web_contents 디렉토리가 존재하는 node1의 pod만 running 상태가 됨
  # 나머지 node에는 디렉토리가 존재하지 않기 때문에 status가 container create에서 멈춤
kubectl delete -f 020.01.mynapp-hostPath-rs.yml -f 020.02.mynapp-hostPath-svc.yml
vi 020.03.mynapp-hostPath-rs-nodeName.yml
watch kubectl get po,svc,rs,ep -o wide --show-labels
kubectl create -f 020.03.mynapp-hostPath-rs-nodeName.yml -f 020.02.mynapp-hostPath-svc.yml
  # 03번 file은 spec에 nodename 작성한 파일이며, 지정한 pod에 node가 replica 개수를 설정한대로 생성됨

# 추가작업
# 개별 node에 /web_contents 디렉토리 생성 후 index.html 구분 가능하게 생성
# 02번 svc.yml file에 loadbalancing 옵션 진행한 뒤 ExternalIP로 loadbalaning 확인