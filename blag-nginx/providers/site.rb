#
# Cookbook Name:: blag-nginx
# Provider:: site
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


action :create do

  template "#{node.nginx.dir}/conf.d/#{new_resource.name}.conf" do
    cookbook "blag-nginx"
    source "site.conf.erb"
    owner  "root"
    group  "root"
    mode   "0644"
    backup false
    variables ({
      :name => new_resource.name,
      :port => new_resource.port,
      :root => new_resource.root
    })
    notifies :reload, 'service[nginx]'
  end

end
