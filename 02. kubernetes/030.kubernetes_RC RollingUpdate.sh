mkdir -p web-newimage/v1
cp index.js web-newimage/v1
cp Dockerfile web-newimage/v1
vi index.js
  # response.write("===Node.js App Version 1===\n")
  # www.listen(8080)
  # 내용 편집
vi Dockerfile
  # EXPOSE 8080으로 변경
  # v1 ~ v4까지 내용 편집하여 개별 이미지 생성 후 docker hub에 push 진행

vi 030.01.mynapp-rc-v1.yml
vi 030.02.mynapp-svc-roll.yml
watch kubectl get rc,pod
watch -n1 -d curl 192.168.122.200
kubectl create -f 030.01.mynapp-rc-v1.yml -f 030.02.mynapp-svc-roll.yml
  # pod와 rc 생성 확인
kubectl rolling-update mynapp-rc-v1 mynapp-rc-v2 --image=leeseonhyo817/myweb:v2
  # rc-v1에서 생성한 pod가 점차 삭제되고 rc-v2에서 생성한 pod가 대체하는 것을 볼 수 있음
  # selector는 옵션에 넣지 않으면 임의로 생성하게 되고 추후에 변경이 안됨
  # 네트워크가 끊어지거나 명령 수행 도중 종료되면 update는 중단되며, 그 상태에서 멈춤