vi 003.01.inventory
ansible -i inventory all -m ping -u student -k
  # 모든 VM에 ping 통신이 되는지 확인

# ansible의 경우 ssh 원격 조정 시 key 기반의 통신을 지향함
ssh-keygen
ssh-copy-id student@192.168.123.41
ssh-copy-id student@192.168.123.51
ssh-copy-id student@192.168.123.52
ansible -i inventory all -m ping
  # 혹시 오류가 난다면 디렉토리와 파일의 권한을 확인해 볼 것
    # chmod 700 /root/.ssh
    # chmod 600 /root/.ssh/id_rsa
    # chmod 644 /root/.ssh/id_rsa.pub
    # chmod 644 /root/.ssh/authorized_keys
    # chmod 644 /root/.ssh/known_hosts

# 추후 원격 node에 패키지 설치 시 root 권한이 필요하며 매번 root password 입력이 불가능하니 passwordless로 변환
  # 모든 node의 /etc/sudoers에 'student ALL=(ALL) NOPASSWD: ALL' 입력
