vi 026.01.index.js
vi 026.02.Dockerfile
sudo docker build -t leeseonhyo817/myweb:customport . --network host
  # 기존의 myweb 이미지의 경우 pod의 container port가 8080으로 한정되게 설정되어 있었음
  # 현재 만드는 이미지의 경우 index.js의 listen 영역을 process의 환경변수(NODE_PORT)를 받아서 지정하게 제작
  # Dockerfile의 EXPOSE는 8080-8090까지 지정할 수 있게 작성
  # EXPOSE의 경우 보여지는 port number이고 실제로는 다르게 설정해도 상관없음
sudo docker login
sudo docker push leeseonhyo817/myweb:customport