vi 005.01.mynapp-ns.yml
kubectl create -f mynapp-ns.yml
    # namespace(quality-assurance) yaml 파일로 생성
kubectl create namespace development
    # namespace(development) 명령형으로 생성
kubectl get namespaces
kubectl create -f mynapp-pod.yml -n development
    # mynapp-pod.yml에 선언된 pod를 development namespace에 종속되도록 생성
kubectl get all
kubectl get all -n development
    # development namespace에 있는 pods를 출력

vi 005.02.mynapp-pod-ns.yml
kubectl create -f mynapp-pod-ns.yml
kubectl get all -n development
kubectl delete -f mynapp-pod-ns.yml
    # mynapp-pod-ns.yml 선언된 리소스들을 삭제(파일은 존재)
kubectl delete -f mynapp-pod.yml -n development
    # develpment namespace에 존재하며 mynapp-pod.yml 파일로 선언된 리소스 삭제
kubectl delete -f mynapp-ns.yml
    # mynapp-ns.yml 파일에 선언된 namespace 삭제
kubectl delete namespace development
    # development namespace 삭제
kubectl delete pods -l tier=frontend
    # label key = tier, label value = frontend를 가지고 있는 pod 삭제