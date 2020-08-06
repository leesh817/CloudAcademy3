vi 007.01.mariadb.yaml
vi 007.02.wordpress.yaml
ansible-playbook -i 004.02.inventory 007.01.mariadb.yaml -b
ansible-playbook -i 004.02.inventory 007.02.wordpress.yaml -b