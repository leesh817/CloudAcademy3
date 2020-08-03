# 0. 사전작업
  # kube-node1,2,3에 10G씩 볼륨 추가
# 1. ceph cluster(kube-master)
git clone --single-branch --branch release-1.3 https://github.com/rook/rook.git
cd rook/cluster/examples/kubernetes/ceph/
kubectl create -f common.yaml, operator.yaml, 
kubectl create -f cluster.yaml
  # bare metal: cluster.yaml
  # public cloud: cluster-on-pvc.yaml
  # minikube: cluster-test.yaml (memory: 8G CPU: 4개 필수)
# 2. ceph toolbox
kubectl create -f toolbox.yaml
kubectl -n rook-ceph exec rook-ceph-tools-<> -- ceph status
  # ceph storage 상태를 확인
  # cluser health가 OK가 떠야 함
# 3. ceph block storage
cd csi/rbd
kubectl crate -f storageclass.yaml
  # Production Replica: storageclass.yaml
  # Production Erasure coding: storageclass-ec.yaml
  # Minikube: storageclass-test.yaml
# 4. ceph file system (cephfs)
cd ../cephfs
kubectl create -f storageclass.yaml
cd ../.. # (~/rook/cluster/example/kubernetes/ceph)
kubectl create -f filesystem.yaml

# rook-cephfs의 storageclass를 default 설정
  # kubectl patch storageclass rook-cephfs -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'