# ezMage

A basic preprovisioned dev box for Magento development

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

After the box starts, you can access it from http://192.168.33.23/ in your browser.  You may also access it from a local domain such as http://ezlamp.local or http://yourdomain.local by setting up any local domains in your hosts file. E.g:

`192.168.33.23 ezlamp.local yourdomain.local`

The document root is in the `public` subdirectory.

#### MailCatcher
Any emails your application sends are caught by MailCatcher, which can be accessed from:
http://192.168.33.23:1080

#### MySQL
Connection details for the MySQL database are:

**database:** magento
**user:** root
**password:** 123

phpMyAdmin can be accessed from http://192.168.33.23:8001

## Configuration
There's not much to configure with ezMage.  Simply edit the Vagrantfile to make any configuration changes you might require.

#### IP Address
You can change the ip of the box by editing the following line in the `Vagrantfile` and replacing 192.168.33.23 with the ip you'd like to use:

`config.vm.network "private_network", ip: "192.168.33.23"`
