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
* Vagrant w/ chef-client
* kitchen w/ chef-zero

##Versions

```
$ vagrant -v
Vagrant 1.7.4

$ chef -v
Chef Development Kit Version: 0.8.1
chef-client version: 12.4.4
berks version: 3.3.0
kitchen version: 1.4.2
```

##Approach

1. Wordpress on a LEMP stack with HHVM (up to /wp-admin/install.php)
2. mysql and nginx deployed with wrapper cookbooks and LWRP
3. db passwords injected from encrypted data bag
4. Simple, and I mean bare bones, linux policy wrapper cookbook
5. Install a couple system packages
6. Create an ops group and add one user (matt) with public key
7. Grant the ops group limited sudo rights to manage nginx as root
8. After provisioning, browse to [http://localhost:8080/] and you should be redirected to the Wordpress setup utility

```
Add a public key to cookbooks/ops-linux/templates/default/authorized_keys/matt.erb
then 'ssh matt@localhost:2222' after provisioning
```

##Vagrant

###Vagrantfile

* Configured with virtualbox
* Supply your own chef-server URL and validation key

```
    chef.chef_server_url = 'https://chef-server'
    chef.validation_key_path = '/etc/chef/validator.pem'
```

###Credentials

mysql passwords are stored in an encrypted databag. For test purposes upload them to your chef-server as follows:

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

###Test

`vagrant up` should do it


##Kitchen

`cookbooks/blag` has a test kitchen config with encrypted data bag support built in. No special configuration needed.

```
$ cd cookbooks/blag
$ kitchen converge
```

