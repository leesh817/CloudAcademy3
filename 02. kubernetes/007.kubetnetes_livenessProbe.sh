vi 007.01.mynapp-pod-liveness1.yml
kubectl create -f mynapp-pod-liveness.yml
kubectl get pods --watch
watch kubectl get pods,services

vi 007.02.mynapp-pod-liveness2.yml
kubectl create -f mynapp-pod-liveness2.yml
    # 동일하게 진행
    # 내부 설치되는 App에 따라 yaml file에 추가해야하는 변수는 다양해짐