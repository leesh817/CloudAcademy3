# mysql yum_repository 추가
ansible node2 -i inventory -m yum_repository -a 'name=MariaDB baseurl=https://ftp.harukasan.org/mariadb/yum/10.4/centos7-amd64 gpgkey=https://ftp.harukasan.org/mariadb/yum/RPM-GPG-KEY-MariaDB gpgcheck=1 description=mariadb' -b
# mysql 설치
ansible node2 -i inventory -m yum -a 'name=MariaDB-server state=installed' -b
# mysql-python 설치
ansible node2 -i inventory -m yum -a 'name=MySQL-python state=installed' -b
# mysql 시작
ansible node2 -i inventory -m service -a 'name=mariadb state=started enabled=true' -b
# mysql 사용자, database 추가
ansible node2 -i inventory -m mysql_db -a 'name=wordpress state=present' -b
ansible node2 -i inventory -m mysql_user -a 'name=wp-admin password=dkagh1. priv=wordpress.*:ALL,GRANT host=192.168.123.51' -b
# mysql 방화벽 해제
ansible node2 -i inventory -m firewalld -a 'service=mysql state=enabled permanent=true immediate=true' -b
# mysql 재시작
ansible node2 -i inventory -m service -a 'name=mariadb state=restarted enabled=true' -b

# web-httpd 설치
ansible node1 -i inventory -m yum -a 'name=httpd state=installed' -b
ansible node1 -i inventory -m service -a 'name=httpd state=started enabled=true' -b
ansible node1 -i inventory -m firewalld -a 'service=http state=enabled permanent=true immediate=true' -b
# web-php 설치
ansible node1 -i inventory -m yum -a 'name=https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm state=present' -b  
ansible node1 -i inventory -m yum -a 'name=https://rpms.remirepo.net/enterprise/remi-release-7.rpm state=present' -b
ansible node1 -i inventory -m yum -a 'name=php enablerepo=remi-php74' -b
ansible node1 -i inventory -m yum -a 'name=php-mysql enablerepo=remi-php74 state=installed' -b
# web-wordpress 설치
ansible node1 -i inventory -m uri -a 'url=https://ko.wordpress.org/latest-ko_KR.tar.gz dest=/home/student/'
ansible node1 -i inventory -m unarchive -a 'remote_src=true src=/home/student/latest-ko_KR.tar.gz dest=/var/www/html/ owner=apache group=apache' -b
# wp-config.php 파일 복사
ansible node1 -i inventory -m copy -a "src=/var/www/html/wordpress/wp-config-sample.php dest=/var/www/html/wordpress/wp-config.php remote_src=yes" -b 
ansible node1 -i inventory -m replace -a "path=/var/www/html/wordpress/wp-config.php regexp=database_name_here replace=wordpress" -b
ansible node1 -i inventory -m replace -a "dest=/var/www/html/wordpress/wp-config.php regexp=username_here replace=wp-admin" -b
ansible node1 -i inventory -m replace -a "dest=/var/www/html/wordpress/wp-config.php regexp=password_here replace=dkagh1." -b
ansible node1 -i inventory -m replace -a "dest=/var/www/html/wordpress/wp-config.php regexp=localhost replace=192.168.123.52" -b
# selinux 해제용 라이브러리 설치
ansible node1 -i inventory -m yum -a "name=libsemanage-python state=latest" -b
# selinux 해제
ansible node1 -i inventory -m seboolean -a "name=httpd_can_network_connect_db state=yes persistent=yes" -b
# web-httpd 재시작
ansible node1 -i inventory -m service -a 'name=httpd state=restarted enabled=true' -b