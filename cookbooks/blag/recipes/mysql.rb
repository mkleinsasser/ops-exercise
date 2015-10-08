#
# Cookbook Name:: blag
# Recipe:: mysql
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

## Get passwords from the encrypted databag
mysql_creds = data_bag_item('creds', 'mysql')

## Install mysql listening on localhost only
ops_mysql_local_service 'blag' do
  version node.mysql_version
  port    node.mysql_port
  root_pass mysql_creds['root']
end
