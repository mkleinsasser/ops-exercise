#
# Cookbook Name:: blag
# Recipe:: wordpress
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Grab the passwords from the encrypted data bag
mysql_creds = data_bag_item('creds', 'mysql')

node.default['wordpress']['db']['root_password'] = mysql_creds['root']
node.default['wordpress']['db']['pass'] = mysql_creds['wordpress']


## wordpress::default installs Apache, which we don't need
include_recipe 'wordpress::app'
