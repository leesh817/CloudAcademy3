kubectl api-resources | grep ingress
  # api-group이 2개 확인됨. extensions group은 삭제 될 예정으로 networking.k8s.io 사용
kubectl api-versions | grep networing.k8s.io
  # api-version이 2개 확인 됨
kubectl explain ing --api-version=networking.k8s.io/v1beta1
  # api-version option 없이 검색하면 extension group이 나오기 때문에 api-version을 직접 설정해서 검색
vi 013.01.mynapp-ing.yml
watch kubectl get pods,svc,rs,ep,ing -o wide --show-labels
  # Ingress controller는 'ing' option으로 확인 가능
kubectl create -f 008.01.mynapp-rs.yml -f 012.01.mymapp-svc-ext-nodeport.yml
  # Ingress 평가하기 위해 yaml file에서 설정한 backend인 NodePort와 NodePort에서 설정한 Replica-Set 생성
kubectl create -f 013.01.mynapp-ing.yml
  # host는 외부에서 접근할 FQDN 설정
  # path는 'FQDN'/ 경로로 설정
curl --resolve mynapp.example.com:80:<WorkerNodeIP> http://mynapp.example.com
  # Ingress는 L7 Loadbalancer로 APP에서 부하분산을 진행
  # 실제로는 외부 DNS가 있어서 Ingress Service로 접근해서 부하분산 진행됨
  # Worker Node에만 pod가 생성되며 위 명령어로 부하분산 확인 가능

vi 013.02.mynapp-ing-multi-paths.yml
kubectl create -f 013.02.mynapp-ing-multi-paths.yml
kubectl get ing
  # host FQDN은 동일하지만 path가 다를 때 사용 가능
  # yaml file에서 작성한 Serive Name이 없기 때문에 접근은 불가능
kubectl describe ing <SeriveName>
  # Rules에서 설정한 경로 확인 가능

vi 013.03.mynapp-ing-multi-hosts.yml
    # host가 다를경우 사용
kubectl create -f 05_mynapp-ing-multi-paths.yml
kubectl get ing
kubectl describe ing mynapp-ing-mhost
    # yaml file에서 설정한 serviceName이 없어서 생성은 되지만 작동하진 않는다.
    # describe에서 rule을 보면 설정한 rule을 확인할 수 있음