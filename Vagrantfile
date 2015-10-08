Vagrant.configure(2) do |config|

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
    
    ## Fix weirdness with my dns. YMMV
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  ## Ubuntu 14.04
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provision "chef_client" do |chef|

    ## ATTENTION: You need to provide these!
    chef.chef_server_url = 'https://chef-server'
    chef.validation_key_path = '/etc/chef/validator.pem'

    chef.delete_node = true
    chef.delete_client = true

    ## Borrow kitchen's data bag secret
    chef.encrypted_data_bag_secret_key_path = './cookbooks/blag/test/integration/default/encrypted_data_bag_secret'
    
    ## run_list
    chef.add_recipe 'blag::default'
    chef.add_recipe 'ops-linux::harden'
  end

end
