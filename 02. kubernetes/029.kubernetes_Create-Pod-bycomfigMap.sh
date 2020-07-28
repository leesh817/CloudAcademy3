mkdir conf
vi conf/nginx-gzip.conf
kubectl create cm nginx-gzip-config --from-file=conf/nginx-gzip.conf
  # 원래 /etc/nginx/conf.d/default.conf 내부에는 gzip 기능이 off 되어있음
  # 그 기능을 ON 시키고 최소한의 기능으로 돌아가게끔 comfigMap을 설정한 파일을 제작하여 cm을 생성함
kubectl describe cm nginx-gzip-config

vi 029.01.mynapp-pod-cm-compress.yml
watch kubectl get po,cm -o wide
kubectl create -f 029.01.mynapp-pod-cm-compress.yml
kubectl describe po mynapp-pod-cm-compress
  # 마운트 정보 확인
kubectl exec mynapp-pod-cm-compress -it bash
cd /etc/nginx/conf.d
  # 확인해보면 nginx-gzip.conf 파일이 마운트되어 존재함
kubectl port-forward mynapp-pod-cm-compress 8080:80
curl localhost:8080
curl -H "Accept-Encoding: gzip" -l localhost:8080
  # gzip 압축 진행

vi 029.02.mynapp-pod-cm-compress-subPath.yml
kubectl create -f 029.02.mynapp-pod-cm-compress-subPath.yml
kubectl exec mynapp-pod-cm-compress-subPath -it bash
cd /etc/nginx/conf.d
  # subPath를 설정해주면 기존의 파일(defalut.conf)도 존재하고 새로운 파일(nginx-gzip.conf)도 마운트되어 존재하게 됨