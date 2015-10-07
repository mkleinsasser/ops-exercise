# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provision "chef_client" do |chef|
    # Provide your own, bro
    #chef.chef_server_url = 'https://chef-server'
    chef.chef_server_url = 'https://chef-server.midco.net'
    #chef.validation_key_path = '/etc/chef/validator.pem'
    chef.validation_key_path = 'c:\dev\src\validator.pem'
    chef.delete_node = true
    chef.delete_client = true
    # use cookbooks/blag/test/integration/default/encrypted_data_bag_secret
    chef.encrypted_data_bag_secret_key_path = './cookbooks/blag/test/integration/default/encrypted_data_bag_secret'
    #chef.encrypted_data_bag_secret_key_path = '/etc/chef/encrypted_data_bag_secret'
    #chef.encrypted_data_bag_secret_key_path = 'c:\dev\src\encrypted_data_bag_secret'
    chef.add_recipe 'blag'
  end

end
