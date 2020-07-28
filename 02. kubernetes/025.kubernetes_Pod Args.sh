watch kubectl get po -o wide
vi 025.01.mynapp-pod-arg.yml
  # 002 file에서 생성한 이미지의 CMD를 yaml file에서 args로 변경하여 결과 관찰
kubectl port-forward mynapp-pod-arg 8080:8080
curl localhost:8080
  # Message 부분에서 변경한 args가 출력됨