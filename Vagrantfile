 # -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "btantlinger/ezmage"
  config.vm.box_version = "0.1.2"
  
  #config.vm.network :forwarded_port, guest: 80, host: 8001
  # Create a private network, which allows host-only access to the machine using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.23"

  config.vm.hostname = "ezmage"
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 8192
    v.cpus = 2
    #v.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
  end  
  
  # config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]    
  # Optional NFS. Make sure to remove other synced_folder line too
  #config.vm.synced_folder ".", "/var/www", :nfs => { :mount_options => ["dmode=777","fmode=666"] }   
  config.vm.synced_folder ".", "/var/www", type: "nfs", mount_options: ['rw', 'vers=3', 'tcp'], linux__nfs_options: ['rw','no_subtree_check','all_squash','async']
  
  config.vm.provision "shell", path: "provision.sh"  
end
