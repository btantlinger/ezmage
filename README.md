# ezMage

A basic preprovisioned dev box for Magento 2 development

- Ubuntu 16.04.4
- nginx
- redis
- elasticsearch
- MySQL 5.7
- PHP 7.1
- composer
- Xdebug
- MailCatcher
- phpMyAdmin
- node & npm
- Gulp, Grunt, Bower, Webpack

## Start up ezMage
Assuming that VirtualBox (https://www.virtualbox.org/) and Vagrant (https://www.vagrantup.com/) are already installed on your machine...

1. Clone or download + unzip repository
2. In your terminal go to the directory and type `vagrant up`
3. Enjoy

## Using ezMage


The default configuration of the box uses the ip 192.168.33.23 and domain magento-dev.local.  The webroot and domain name can be changed in the provision.sh shell file.


You should make an entry in your /etc/hosts file for the domain. E.g

`192.168.33.23 magento-dev.local`


#### MailCatcher
Any emails your application sends are caught by MailCatcher, which can be accessed from:
http://192.168.33.23:1080

#### MySQL
Connection details for the MySQL database are:

**database:** magento
**user:** root
**password:** 123

phpMyAdmin can be accessed from http://192.168.33.23:8001

## Magento setup

Log in to the vagrant

```
vagrant ssh

```

Change to the web root and set up magento:


```
 php bin/magento setup:install \
   --admin-firstname=John \
   --admin-lastname=Smith \
   --admin-email=jsmith@mail.com \
   --admin-user=admin \
   --admin-password=123123q \
   --base-url=http://magento-dev.local/ \
   --db-host=localhost \
   --db-name=magento \
   --db-user=root \
   --db-password=123 \
   --currency=USD \
   --timezone=America/New_York \
   --language=en_US \
   --use-rewrites=1

```

Compile Magento

```
php magento setup:di:compile

```

Deploy Magento

```
php magento setup:static:deploy

```

#### IP Address
You can change the ip of the box by editing the following line in the `Vagrantfile` and replacing 192.168.33.23 with the ip you'd like to use:

`config.vm.network "private_network", ip: "192.168.33.23"`
