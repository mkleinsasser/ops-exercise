#
# Cookbook Name:: blag
# Recipe:: nginx
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

## Install nginx and hhvm
include_recipe 'ops-nginx'
include_recipe 'ops-nginx::hhvm'

## Set up the site
ops_nginx_hhvm_site 'blag' do
  port node.port
  root node.http_root
end

## Grant the ops group process control rights for nginx
## It would probably make sense to include hhvm process control in this too.
ops_nginx_sudo 'ops' do
  group node['ops_linux']['ops_group']
end
