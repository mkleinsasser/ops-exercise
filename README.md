#Starter Project
##Purpose
  * Assess your ability to take some general specs to a working demo
  * Gives us something to talk about
  * Shouldn't take more than 4 hours
  * Don't make it too complex

##Spec
###Need to have
  * Chef cookbook[s], structure as you see fit.
  * Implement a Linux, MySQL, HHVM, Nginx single host running some sort of blog software (take your pick)
  * Base OS should be ubuntu 14.04
  * Use Berkshelf for dependancy management, please no vendor drops (but version locks are good!)
  * Should leverage community cookbooks when it make sense.
  * Shoud be testable using Vagrant.
 
###Nice to have
  * Security hardening and user management.
  * Should converge both in chef-zero and chef-client modes.
  * Take care with secrets!
  * Funcitonal/Unit/Lint tests are cool.
  * Think in terms of re-usable components.
  * Bonus points for a rake/Thor file for common tasks.

#Implementation

* Top-level cookbook `cookbooks/blag`
* kitchen w/ chef-zero
* vagrant w/ chef-client

##Environment

```
$ vboxmanage -v
5.0.0r101573

$ chef -v
Chef Development Kit Version: 0.8.1
chef-client version: 12.4.4
berks version: 3.3.0
kitchen version: 1.4.2

$ vagrant -v
Vagrant 1.7.4

```

##Overview

####Stack

1. Ubuntu 14.04
1. LEMP + HHVM running Wordpress and ready to run /wp-admin/install.php
1. Local mysql instance listening on localhost only
1. Hardened with os-hardening and ssh-hardening with out of the box defaults
1. High level serverspec validation of completed node

####Cookbooks

1. Top-level cookbook `cookbooks/blag`
1. Wrapper cookbooks + LWRPs stubbed out for linux, mysql, and nginx, ready to inject company policies
1. Db credentials injected via encrypted data bag

####Users and groups

1. "ops" group with limited sudo rights for nginx process control
1. "matt" user in ops group with public key
1. Drop your own public key in `cookbooks/ops-linux/templates/default/authorized_keys/matt.erb` if you like

##Kitchen

No special configuration needed

####Provision

```
$ cd cookbooks/blag
$ kitchen converge
```

####Serverspec validation

```
$ kitchen verify
```

####Try it

Browse to <http://localhost:8080> which will redirect you to <http://localhost:8080/wp-admin/install.php>

####Destroy

```
$ kitchen destroy
```

##Vagrant

####Vagrantfile

* Supply your own chef-server URL and validation key

```
    chef.chef_server_url = 'https://chef-server'
    chef.validation_key_path = '/etc/chef/validator.pem'
```

####Db credentials

mysql passwords are stored in an encrypted databag. It's easy to borrow kitchen's databag for test purposes.

```
$ knife data bag create creds
Created data_bag[creds]

$ knife data bag from file creds cookbooks/blag/test/integration/default/data_bags/creds/mysql.json
Updated data_bag_item[creds::mysql]

$ knife data bag show creds mysql --secret-file cookbooks/blag/test/integration/default/encrypted_data_bag_secret
Encrypted data bag detected, decrypting with provided secret.
id:        mysql
root:      
wordpress: 

```

####Provision

`vagrant up`

####Try it

Browse to <http://localhost:8080> which will redirect you to <http://localhost:8080/wp-admin/install.php>

####Destroy

`vagrant destroy`


