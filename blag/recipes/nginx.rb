#
# Cookbook Name:: blag
# Recipe:: nginx
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'blag-nginx'

blag_nginx_site "blag" do
  port 80
  root "/var/www"
end
