#!/bin/bash
apt install apache2 php7.2 php-mysql -y
wget https://ko.wordpress.org/wordpress-5.3.4-ko_KR.tar.gz
tar xf wordpress-5.3.4-ko_KR.tar.gz -C /var/www/html
rm -rf wordpress-5.3.4-ko_KR.tar.gz
chown -R www-data:www-data /var/www/html/
systemctl start apache2
systemctl enable apache2
