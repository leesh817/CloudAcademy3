kubectl create -f 008.01.mynapp-rs.yml
vi 012.01.mynapp-svc-ext-nodeport.yml
watch kubectl get pods,rs,svc,ep -o wide --show-labels
kubectl create -f 012.01.mynapp-svc-ext-nodeport.yml
  # node의 Port를 open하기 때문에 따로 External-IP가 부여되지 않음
  # 여기서 node는 Master, Worker Node를 가리킴
  # client는 접속 시 master or worker node의 IP와 port(31111)로 접근 -> service의 port(80) -> pod의 port(8080)로 접근
  # targetPort(pod의 port)는 앞서 replica-set의 yaml file에서 open한 port로 작성
curl <MasterNodeIP>:31111 # <Worker1NodeIP>:31111 <Worker2NodeIP>:31111 <Worker3NodeIP>:3111
curl <Replica-setIP>:80 # service의 cluster IP와 작성한 yaml file에서 열어준 port로 접근
curl <Pod1IP>:8080 # <Pod2IP>:8080 <Pod3IP>:8080 방금 작성한 yaml file(targetPort) 및 replica-set의 yaml file(containerPort)에서 작성한 port가 open

vi 012.02.mynapp-svc-ext-loadbalancer.yml
watch kubectl get pods,rs,svc,ep -o wide --show-labels
kubectl create -f 008.01.mynapp-rs.yml -f 012.02.mynapp-svc-ext-loadbalancer.yml
  # pods, replica-set, service, endpoint, External-IP 생성됨
curl <External-IP>
  # 외부에서 External-IP로 접근 시 3개의 pod에 부하분산되서 접근 가능
curl <MasterIP>:<HostPort> # <WorkerNode1IP>:<HostPort> <WorkerNode2IP>:<HostPort> <WorkerNode3IP>:<HostPort>
  # Node의 IP 및 open 되어있는 port로 접근 시 Node에 생성된 pod로 접근 가능

vi 012.03.myanpp-svc-ext-extname.yml
watch kubectl get pods,rs,svc,ep -o wide --show-labels
kubectl create -f 012.03.myanpp-svc-ext-extname.yml
  # External Name service는 내부의 pod가 FQDN 주소가 바뀌더라도 service의 CNAME만 변경하면 접근 가능하도록 도와주는 service임
  # 생성 시 ClusterIP는 없고 External-IP에 yaml file에서 작성한 FQDN이 설정됨
  # edit 혹은 yaml file 내부에 FQDN 수정 시 변경된 FQDN이 설정됨
kubectl run nettool -it --image=c1t1d0s7/network-multitool --generator=run-pod/v1 --rm=true bash
  # 새로운 pod를 생성하여 확인작업 진행
nslookup <ServiceName>
ping -c 2 <ServiceName>
  # 지정한 ServiceName으로 확인하면 FQDN으로 접속하여 정보를 가져옴
host -v <ServiceName>
  # Question section 및 Answer section 확인 가능.