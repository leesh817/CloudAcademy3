#!/bin/bash
# kube-master1(NFS-server)
sudo apt install -y nfs-kernel-server
sudo mkdir /exports/nfs-vols
echo "Hello NFS-Volumes" | sudo tee /exports/nfs-vols/index.html
sudo vi /etc/exports
  # /exports/nfs-vols   192.168.122.0/24(rw,sync,no_subtree_check,no_root_squash)
  # no_subtree_check: 하위 디렉토리 공유
  # container는 모두 root 권한으로 접근해야 함
sudo systemctl status nfs-server
sudo exportfs -rva
sudo iptables -A INPUT -p tcp --dport 2049 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 2049 -j ACCEPT
    # 방화벽(ufw) 해제 (centos에서 firewalld와 동일)
    # 개별 port를 지정해야 함
sudo iptables -L -n | grep 2049 # iptable 확인 방법

# kube-node1,2,3
sudo apt install -y nfs-common # client 기능
sudo mount kube-master1:/exports/nfs-vols /mount
  # mount 확인
sudo umount /mnt