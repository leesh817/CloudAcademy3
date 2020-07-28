mkdir configmap
echo "8080" > configmap/nodeport
echo "Hello configMap" > configmap/message
kubectl create cm mynapp-pod-options --from-file=configmap/
  # 환경변수 저장용 Config Map을 사용
  # file 내부에 사용할 환경변수를 저장하고 comfigmap을 생성하여 사용함
  # 환경변수를 일일이 변경할 필요 없이 파일내용만 변경하면 환경변수가 변경되어 활성화됨

vi 028.01.mynapp-pod-cm.yml
watch kubectl get po,cm -o wide
kubectl create -f 028.01.mynapp-pod-cm.yml
  # yaml file에서 args를 내부 이름 선언한 것으로 바로 변경 가능
kubectl port-forward mynapp-pod-cm 8080:8080
curl localhost:8080
  # pod가 제대로 생성되고 접근이 잘 된다면 Message가 변경된 것을 확인할 수 있음