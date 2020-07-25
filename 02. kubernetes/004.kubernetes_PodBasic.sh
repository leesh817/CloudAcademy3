vi 004.01.mynapp-pod.yml
kubectl create -f mynapp-pod.yml
kubectl get pods mynapp-pod
kubectl get pods/mynapp-pod
kubectl get pods mynapp-pod -o yaml
    # 출력 형식을 yaml file 형식으로 출력
kubectl describe pods mynapp-pod
    # pod의 자세한 내용을 보기 편하게 출력해 줌
    # Events는 resource log
kubectl logs mynapp-pod
    # container의 log 확인
kubectl port-forward mynapp-pod 8080:8080
    # kubectl이 설치되어있는 곳까지 port-forwarding 진행
    # 외부통신은 service에서 진행
kubectl exec mynapp-pod ls
kubectl exec mynapp-pod -- ls -l
kubectl exec mynapp-pod -it bash
kubectl attach mynapp-pod
    # 컨테이너에 접근 가능 
    # 컨테이너의 본래 목적인 서비스 제공과는 다르며, 내부를 확인하거나 오류 확인용으로 사용 가능

vi mynapp-pod-muitl.yml
kubectl create -f mynapp-pod-muitl.yml
    # 하나의 Pod에는 하나의 네트워크만 할당되며, 하나의 네트워크 내에서는 동일한 포트를 동시에 사용할 수 없음
    # 멀티 컨테이너는 주 컨테이너와 보조 컨테이너로 대부분 사용함