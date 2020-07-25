kubectl api-resources | grep job
kubectl api-versions | grep batch
vi 05_mynapp-job.yml
watch kubectl get po,job -o wide --show-labels
kubectl create -f vi 05_mynapp-job.yml
  # pod 생성 후 60초 지나면 status가 complated로 변하고 job의 completion도 1/1로 변함

vi 010.01.mynapp-job-comp.yml
watch kubectl get pods,job -o wide --show-labels
kubectl create -f 06_mynapp-job-comp.yml
  # 60초마다 pod가 생성되며 앞선 pod는 completed, job의 completion 수 증가
kubectl desribe job mynapp-job-comp
  # job의 시작과 종료 확인 가능

vi 010.02.mynapp-job-comp-para.yml
watch kubectl get po,job -o wide --show-labes
kubectl create -f 07_mynapp-job-comp-para.yml
  # job에는 completion 및 parallism의 숫자에 따라 pod가 동시에 생성되며 1턴이 종료되면 그 다음 턴이 시작됨
kubectl describe job mynapp-job-comp-para

kubectl api-resources | grep crontab
kubectl api-versions | grep batch
kubectl explain cronjob
  # 실 사용해야하는 api version 정확히 확인
vi 010.03.mynapp-cjob.yml
watch kubectl get po,cronjobs -o wide --show-labels
kubectl create -f 08_mynapp-cjob.yml
  # 매 2분마다 pod가 생성되며, 생성된 pod는 60초 이후에 종료되어 status가 completed로 전환

vi 010.04.mynapp-cjob-policy-forbid.yml
watch kubectl get po,cronjobs -o wide --show-labels
kubectl create -f 09_mynapp-cjob-policy-forbid.yml
  # 차이점이 확인되지 않음

vi 010.05.mynapp-cjob-policy-replace.yml
watch kubectl get po,cronjobs -o wide --show-labels
kubectl create -f 10_mynapp-cjob-policy-replace.yml
  # 매 2분마다 기존의 pod를 종료시키고 새로운 pod를 생성함