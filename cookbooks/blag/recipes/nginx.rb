#
# Cookbook Name:: blag
# Recipe:: nginx
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


include_recipe 'ops-nginx'
include_recipe 'ops-nginx::hhvm'

ops_nginx_hhvm_site 'blag' do
  port node.port
  root node.http_root
end
