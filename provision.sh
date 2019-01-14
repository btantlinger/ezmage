#!/bin/bash

cat <<'EOF' | sudo tee /etc/nginx/sites-available/magento
upstream fastcgi_backend {
	server unix:/run/php/php7.1-fpm.sock;
}

server {
	listen 80;
	server_name magento-dev.local;
	set $MAGE_ROOT /var/www/magento;
	include /var/www/magento/nginx.conf.sample;
}
EOF

sudo service nginx restart

