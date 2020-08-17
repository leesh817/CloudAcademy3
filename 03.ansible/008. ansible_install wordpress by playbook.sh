vi 008.01.inventory
vi 008.02.ansible.cfg
ansible-config --version
  # .ansible.cfg 파일 적용 확인
ansible all -m ping
  # 개별 node 통신여부 확인
vi 008.03.mariadb_create.yaml
vi 008.04.wordpress_crate.yaml
vi 008.05.haproxy_crate.yaml
ansible-playbook 008.03.mariadb_create.yaml
ansible-playbook 008.04.wordpress_crate.yaml
ansible-playbook 008.05.haproxy_crate.yaml