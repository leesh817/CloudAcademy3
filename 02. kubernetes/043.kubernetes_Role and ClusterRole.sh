#     Role     <--     Role Binding     --> User
# Cluster Role <-- Cluster Role Binding --> User
# Role: Namespace의 권한을 설정
# Role Binding: Namespace의 Role과 User를 연결
# Cluster Role: Cluster 전체의 권한을 설정
# Cluster Role Binding: Cluster Role과 User를 연결
vi 043.01.role-read-default-pod.yml
  # namespace: default
kubectl create -f 043.01.role-read-default-pod.yml
kubectl get role
kubectl describe role read-defalut-pod
  # default namespace내의 모든 API Group 사용 가능. pod 리소스 확인 가능

vi 043.02.crole-read-cluster-pod.yml
kubectl create -f 043.02.crole-read-cluster-pod.yml
kubectl get clusterrole read-cluster-pod
kubectl describe clusterrole read-cluster-pod
  # pod에 대하여 정보를 확인 가능

kubectl get sa
  # Service Accout 확인
  # 기본적으로 default 계정 존재하며 Service Accout 생성 시 자동으로 Secret 생성.
  # Secret에는 CA 인증서, Namespace, Token 저장
kubectl describe sa default
  # Namespace, Token 확인
kubectl describe secret default-token-XXX
  # CA 인중서, Token, Namespace 확인
vi 043.03.sa-myuser1.yml
vi 043.04.sa-myuser2.yml
vi 043.05.sa-myadmin.yml
kubectl create -f 043.03.sa-myuser1.yml -f 043.04.sa-myuser2.yml -f 043.05.sa-myadmin.yml
kubectl get sa
  # 3개의 사용자 리소스 생성

vi 043.06.rbind-myuser1-read.yml
kubectl create -f 043.06.rbind-myuser1-read.yml
  # read-default-pod(Role) <-- myuser1-read-default(Role Binding) --> myuser1(User)
kubectl get rolebinding
kubectl describe rolebinding myuser1-read-default
  # role binding 상태 확인

vi 043.07.crbind-myuser2-read.yml
kubectl create -f 043.07. crbind-myuser2-read.yml
  # read-cluster-pod(Cluster Role) <-- myuser2-read-cluster(Cluster Role Binding) --> myuser2(User)
kubectl get clusterrolebinding | grep my
kubectl describe clusterrolebinding myuser2-read-cluster
  # cluster role binding 상태 확인

vi 043.08.crbind-myadmin.yml
kubectl create -f 043.08.crbind-myadmin.yml
  # admin(Cluster Role) <-- myadmin-cluster(Cluster Role Binding) --> myadmin(User)
kubectl get clusterrolebinding | grep my
kubectl describe clusterrolebinding myadmin-cluster