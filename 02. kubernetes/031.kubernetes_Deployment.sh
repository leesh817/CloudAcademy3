watch kubectl get po,svc,ep,rc,deploy -o wide
watch curl 192.168.122.200
vi 031.01.mynapp-deploy-v1.yml
vi 031.02.mynapp-svc-deploy.yml
kubectl create -f 031.01.mynapp-deploy-v1.yml -f 031.02.mynapp-svc-deploy.yml
kubectl rollout status deployment mynapp-deploy
  # 성공적으로 pod와 rc, svc가 생성되면 status가 successful로 출력됨
kubectl rollout history deployment mynapp-deploy
  # 생성한 history를 보여줌
kubectl set image deployment mynapp-deploy mynapp=leeseonhyo817/myweb:v2
  # container이름이 들어가는 이유는 multi-container일 경우에 실수하면 안되기 때문
kubectl rollout status deployment mynapp-deploy
  # container 내부의 이미지를 myweb:v2로 변경하고, status로 실 상황 출력
kubectl rollout history deployment mynapp-deploy
  # set image로 변경한 것은 정확하게 명령어가 남지 않음
kubectl set image deployment mynapp-deploy mynapp=leeseonhyo817/myweb:v3 --record
kubectl rollout status deployment mynapp-deploy
kubectl rollout history deployment mynapp-deploy
  # record option 추가하면 history에 명령어가 저장됨
kubectl rollout undo deployment mynapp-deploy --to-revison=2
  # history 목록 중 2번째로 돌아가려고 할 때 사용
kubectl rollout status deployment mynapp-deploy
kubectl rollout history deployment mynapp-deploy
  # history 확인 시 2번째 상태의 내용이 4번째 상태의 내용으로 동일하게 저장됨
vi 031.03.mynapp-deploy-v3.yml
kubectl apply -f 031.03.mynapp-deploy-v3.yml
kubectl rollout status deployment mynapp-deploy
kubectl rollout history deployment mynapp-deploy
  # set image가 아닌 yaml file을 생성하여 container image 변경
  # yaml file 내부에 annotation 작성 시 history에 annotation이 저장됨