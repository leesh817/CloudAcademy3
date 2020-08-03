helm upgrade mydb-custom stable/mysql --set service.port=13306
helm list
  # Revision이 2로 변경되어 있음
kubectl get svc
  # port 번호가 변경되어 있음
helm history mydb-custom 
  # history 목록 확인 가능
  # kubernetes의 Deployment에서 rollout, history 명령어와 비슷한 역할
  
helm rollback mydb-custom 1
  # history 목록의 1번으로 되돌림
  # kubernetes의 Deployment에서 rollout, history 명령어와 비슷한 역할
helm history mydb-custom
  # 3번이 추가되어 있으며 Description에 rollback 했다고 명시됨
kubectl get svc
  # port 번호가 다시 3306으로 변경됨