#!/bin/bash

#Set the host name 
SRV_NAME="magento-dev.local"

#Set the php version.  May be 7.1 or 7.2
PHP_VERSION="7.2"

#Set Web root relative to /var/www
WEB_ROOT="magento"


# Update PHP version
sudo update-alternatives --set php /usr/bin/php${PHP_VERSION}
sudo systemctl stop php7.1-fpm.service #> /dev/null 2>&1 & 
sudo systemctl stop php7.2-fpm.service #> /dev/null 2>&1 &
sudo systemctl disable php7.1-fpm.service #> /dev/null 2>&1 & 
sudo systemctl disable php7.2-fpm.service #> /dev/null 2>&1 &
sudo systemctl enable php${PHP_VERSION}-fpm.service #> /dev/null 2>&1 &
sudo systemctl start php${PHP_VERSION}-fpm.service #> /dev/null 2>&1 &


cat <<EOF | sudo tee /etc/nginx/sites-available/magento
upstream fastcgi_backend {
	server unix:/run/php/php${PHP_VERSION}-fpm.sock;
}

server {
	listen 80;
	server_name ${SRV_NAME};
	set \$MAGE_ROOT /var/www/${WEB_ROOT};
	include /var/www/${WEB_ROOT}/nginx.conf.sample;
}
EOF
sudo service nginx restart
