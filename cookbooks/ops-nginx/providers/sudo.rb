#
# Cookbook Name:: ops-nginx
# Provider:: sudo
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


action :create do

#TODO: prohibit "." dot and "~" tilde in the resource name per sudoers man page

  template "/etc/sudoers.d/#{new_resource.name}_ops-nginx" do
    cookbook "ops-nginx"
    source "sudoers.d.erb"
    owner "root"
    group "root"
    mode "0440"
    backup false
    variables ({
      :name => new_resource.name.upcase,
      :group => new_resource.group
    })
  end

end
