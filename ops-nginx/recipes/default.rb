#
# Cookbook Name:: ops-nginx
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'hhvm'
include_recipe 'nginx'

## disable the default site on port 80
file "#{node.nginx.dir}/conf.d/default.conf" do
  action :delete
  notifies :reload, 'service[nginx]'
end
