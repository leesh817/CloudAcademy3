watch kubectl get po,rs,svc,pv,pvc -o wide --show-labels
vi 022.01.mynapp-nfs-pv.yml
kubectl create -f 022.01.mynapp-nfs-pv.yml
  # accessModes의 option은 3가지가 존재
    # 특성에 맞게 사용해야 함
  # persistentVolumeReclaimPolicy의 option은 2가지 존재
    # Retain은 pv만 삭제하고 실제 volume은 남김
    # Delete는 pv 및 실제 volume 내용도 삭제
  # pv의 status가 avilable이 되어야 사용 가능한 상태
vi 022.02.mynapp-nfs-pvc.yml
kubectl create -f 022.02.mynapp-nfs-pvc.yml
  # pvc는 실제 요청할 volume 크기와 accessMode 설정
  # pvc 생성 후 pv와 pvc의 status가 Bound 상태가 되어야 실제로 연결됨
  # pending 상태이면 오류이며, 파일 내부의 오류 확인 진행
vi 022.03.mynapp-nfs-rs.yml
vi 022.04.mynapp-nfs-svc.yml
kubectl create -f 022.03.mynapp-nfs-rs.yml -f 022.04.mynapp-nfs-svc.yml
  # replicaset 생성 시 volume 내용 추가(spec.template.spec.containers.volumeMounts 및 spec.template.spec.volumes)
  # service는 loadbalancer type로 생성하여 pod에 접근 가능하게 작성
kubectl run nettool -it --image=c1t1d0s7/network-multitool --generator=run-pod/v1 --rm=true bash
curl mynapp-nfs-svc
  # replicaset의 container 내부에 nginx가 설치되어 있으며 pv 내부에 index.html 파일이 있기 때문에 파일 내부의 내용을 불러옴

# 추가실습1
# pv의 persistentVolumeReclaimPolicy를 Delete로 변경 후 실습 진행
# delete로 변경 후 pv, pvc만 생성한 뒤 pvc 삭제하면 pv의 status가 failed로 변경
# 즉시 pvc 생성하더라도 Status가 Bound로 되지 않음 (다시 붙지 않음)

# 추가실습2
# 4개의 file 모두 create한 뒤 pvc 삭제 시 pvc 삭제 되지 않음
# replicaset에서 사용중이기 때문에 사용중일땐 삭제가 진행되지 않음
# replicaset 삭제 시 pvc 삭제 진행됨
# pv 삭제 후 다시 생성하면 pvc와 pv가 다시 Bound 상태가 됨