vi 017.01.fortune.sh
vi 017.02.Dockerfile
sudo docker build -t leeseonhyo817/fortune:latest . --network host
  # fortune image 생성
sudo docker login
sudo docker push leeseonhyo817/fortune:latest 
  # 생성한 image docker hub로 push