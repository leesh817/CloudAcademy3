vi 006.01.mynapp-pod-label.yml
kubectl create -f mynapp-pod-label.yml
kubectl get pods --show-labels
    # label 속성을 추가하여 pods의 현재 상태 출력
kubectl get pods -L env,tier
    # label key인 env, tier를 포함하여 pods 상태 출력
kubectl get pods mynapp-pod-label -o yaml
kubectl descirbe pods mynapp-pod-label
kubectl label pods mynapp-pod partition=Aclass
    # 기존에 있던 pod에 label 추가 방법
kubectl label pods mynapp-pod-label env=debug --overwrite
    # label 내용 변경 방법
kubectl label pods mynapp-pod-label partition-
    # label 삭제 방법
kubectl get pods --show-labels
kubectl get pods -L env,tier
    # label 확인
kubectl get pods --show-labels -l tier
kubectl get pods --show-labels -l '!tier'
kubectl get pods --show-labels -l 'env=dev'
kubectl get pods --show-labels -l 'env!=dev'
    # 균등기반 레이블 셀렉터
kubectl get pods --show-labels -l 'env in (debug, dev)'
kubectl get pods --show-labels -l 'tier notin (frontend)'
    # 

vi 006.02.mynapp-rc.yml
kubectl create -f mynapp-rc.yml
watch kubectl get rc,pods --show-labels
kubectl describe rc mynapp-rc
    # Selector, Labels, Replicas 확인 가능
kubectl delete pods mynapp-rc-s4dwx
    # 삭제 시 개수를 맞추기 위해 rc에서 새로운 pod를 자동 생성
kubectl label pods mynapp-rc-vtpnt app-
    # pod의 label을 삭제 시 rc에선 관리하는 pod가 2개로 축소되었다고 인식하고 1개를 새로 생성
kubectl label pods mynapp-rc-vtpnt app=mynapp-rc
    # label을 다시 붙이면 관리하는 pod가 4개가 되어서 최근에 생성한 1개의 pod를 제거
kubectl scale rc mynapp-rc --replicas=4
    # rc의 replica 개수를 수동으로 늘렸으니 1개를 추가로 생성하며, rc의 상태에서도 개수가 증가
kubectl edit rc mynapp-rc
    # rc의 yml 파일을 직접 수정이 가능함. 변경 가능한 것만 변경 가능. 개수를 늘려봤는데 pod 개수가 증가하고 rc 상태에서 개수도 증가함
kubectl replace -f mynapp-rc.yml
    # 기존의 파일대로 원상복구 가능. replica 개수가 줄어듬
kubectl delete rc mynapp-rc
    # rc를 삭제 시 종속되어있던 pod도 동시에 삭제됨