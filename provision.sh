#!/bin/bash

#Set the host name 
SRV_NAME="magento-dev.local"

#Set the php version.  
PHP_VERSION="7.4"

#Set Web root relative to /var/www
WEB_ROOT="magento"

#Optionally add certificate files
SSL_CERT="cert.pem"
SSL_CERT_KEY="cert-key.pem"


CONF_FILE="/var/www/nginx.conf"
if [[ -f $CONF_FILE ]];then
    sudo cp $CONF_FILE /etc/nginx/sites-available/
fi    

cat <<EOF | sudo tee /etc/nginx/sites-available/magento
upstream fastcgi_backend {
        server unix:/var/run/php/php${PHP_VERSION}-fpm.sock;
}

server {
        listen 80;
        server_name ${SRV_NAME};
        set \$MAGE_ROOT /var/www/${WEB_ROOT};
        include /etc/nginx/sites-available/nginx.conf;
}

EOF

CERT="/var/www/${SSL_CERT}"
CERT_KEY="/var/www/${SSL_CERT_KEY}"
if [[ -f $CERT ]] && [[ -f $CERT_KEY ]];then

    sudo cp $CERT /etc/nginx/sites-available/$SSL_CERT
    sudo cp $CERT_KEY /etc/nginx/sites-available/$SSL_CERT_KEY    

cat <<EOF | sudo tee -a /etc/nginx/sites-available/magento
server {
        listen 443;
        ssl on;
        ssl_certificate /etc/nginx/sites-available/$SSL_CERT;
        ssl_certificate_key /etc/nginx/sites-available/$SSL_CERT_KEY;
        server_name ${SRV_NAME};
        set \$MAGE_ROOT /var/www/${WEB_ROOT};
        include /etc/nginx/sites-available/nginx.conf;
}
EOF
fi


sudo service nginx restart
